import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../controllers/vacancies_controller.dart';
import '../widgets/vacancy_card.dart';
import 'vacancy_details_screen.dart';

class VacancyListScreen extends StatelessWidget {
  const VacancyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/images/UNHCR_LOGO.png',
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Consumer<VacanciesController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return VacancyCard(
                  isLoading: true,
                  onTap: () {},
                );
              },
            );
          }

          if (controller.errorMessage.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (ScaffoldMessenger.of(context).mounted) {
                ScaffoldMessenger.of(context).clearSnackBars();
              }

              HapticFeedback.vibrate();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please try again"),
                  backgroundColor: Colors.red,
                ),
              );
            });

            return Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline,
                        color: Colors.red, size: 60),
                    const SizedBox(height: 12),
                    Text(
                      'Oops! Something went wrong.',
                      style: TextStyle(
                        color: colorScheme.onSurface,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        controller.loadVacancies();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (controller.vacancies != null &&
                controller.vacancies!.isNotEmpty) {
              if (ScaffoldMessenger.of(context).mounted) {
                ScaffoldMessenger.of(context).clearSnackBars();

                HapticFeedback.lightImpact();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text('Successfully retrieved the list of vacancies'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            }
          });

          return RefreshIndicator(
            onRefresh: () async {
              try {
                HapticFeedback.heavyImpact();
                await controller.loadVacancies();
              } catch (e) {
                print('Error during refresh: $e');
                HapticFeedback.vibrate();
              }
            },
            color: const Color(0xFF007ac2),
            child: ListView.builder(
              itemCount: controller.vacancies?.length ?? 0,
              itemBuilder: (context, index) {
                final vacancy = controller.vacancies?[index];
                if (vacancy == null) {
                  return const SizedBox.shrink();
                }
                return VacancyCard(
                  vacancy: vacancy,
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VacancyDetailsScreen(vacancy: vacancy),
                      ),
                    );
                  },
                  isLoading: false,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

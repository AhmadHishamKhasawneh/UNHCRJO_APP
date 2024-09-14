import 'package:flutter/material.dart';
import '../models/vacancy.dart';

class VacancyDetailsScreen extends StatelessWidget {
  final Vacancy vacancy;

  const VacancyDetailsScreen({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          vacancy.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: vacancy.jobId,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      vacancy.imageUrl,
                      height: 180,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                vacancy.company,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(vacancy.location, style: TextStyle(color: Colors.grey[700])),
              const SizedBox(height: 12),
              const Text(
                'Job Description:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(vacancy.longDescription,
                  style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Salary:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(vacancy.salary, style: const TextStyle(fontSize: 16)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Posted on:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(vacancy.datePosted),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

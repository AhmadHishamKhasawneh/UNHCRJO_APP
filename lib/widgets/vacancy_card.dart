import 'package:flutter/material.dart';
import '../models/vacancy.dart';
import 'shimmer_placeholder.dart';

class VacancyCard extends StatefulWidget {
  final Vacancy? vacancy;
  final VoidCallback onTap;
  final bool isLoading;

  const VacancyCard({
    super.key,
    required this.onTap,
    this.vacancy,
    this.isLoading = false,
  });

  @override
  State<VacancyCard> createState() => _VacancyCardState();
}

class _VacancyCardState extends State<VacancyCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subTextColor = isDarkMode ? Colors.grey[400] : Colors.grey[600];
    final descriptionColor = isDarkMode ? Colors.grey[300] : Colors.black54;

    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: widget.isLoading
                  ? LayoutBuilder(
                      builder: (context, constraints) {
                        final double width = constraints.maxWidth;
                        return Row(
                          children: [
                            const ShimmerPlaceholder(width: 50, height: 50),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShimmerPlaceholder(
                                      width: width * 0.3, height: 14),
                                  const SizedBox(height: 6),
                                  ShimmerPlaceholder(
                                      width: width * 0.25, height: 12),
                                  const SizedBox(height: 4),
                                  ShimmerPlaceholder(
                                      width: width * 0.15, height: 10),
                                  const SizedBox(height: 6),
                                  ShimmerPlaceholder(
                                      width: width * 0.6, height: 10),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Hero(
                              tag: widget.vacancy!.jobId,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  widget.vacancy!.imageUrl,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.vacancy!.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    widget.vacancy!.company,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: subTextColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.vacancy!.location,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: subTextColor,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    widget.vacancy!.description,
                                    maxLines: _isExpanded ? null : 3,
                                    overflow: _isExpanded
                                        ? TextOverflow.visible
                                        : TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: descriptionColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
            if (widget.vacancy != null)
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  icon: Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

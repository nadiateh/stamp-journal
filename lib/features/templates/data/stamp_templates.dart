import '../models/stamp_template.dart';

class StampTemplates {
  StampTemplates._();

  static const List<StampTemplate> all = [
    // Geometric
    StampTemplate(
      id: 'square',
      name: 'Square',
      category: StampCategory.geometric,
      shape: StampShape.square,
      aspectRatio: 1,
      description: 'A classic square stamp.',
    ),
    StampTemplate(
      id: 'portrait',
      name: 'Portrait',
      category: StampCategory.geometric,
      shape: StampShape.rectangle,
      aspectRatio: 0.75,
      description: 'A vertical rectangular stamp.',
    ),
    StampTemplate(
      id: 'landscape',
      name: 'Landscape',
      category: StampCategory.geometric,
      shape: StampShape.rectangle,
      aspectRatio: 1.4,
      description: 'A horizontal rectangular stamp.',
    ),
    StampTemplate(
      id: 'circle',
      name: 'Circle',
      category: StampCategory.geometric,
      shape: StampShape.circle,
      aspectRatio: 1,
      description: 'A perfectly round stamp.',
    ),
    StampTemplate(
      id: 'oval',
      name: 'Oval',
      category: StampCategory.geometric,
      shape: StampShape.oval,
      aspectRatio: 0.75,
      description: 'A soft oval-shaped stamp.',
    ),

    // Postage
    StampTemplate(
      id: 'classic_postage',
      name: 'Classic Postage',
      category: StampCategory.postage,
      shape: StampShape.postage,
      aspectRatio: 0.85,
      description: 'A traditional postage stamp.',
    ),
    StampTemplate(
      id: 'scalloped',
      name: 'Scalloped',
      category: StampCategory.postage,
      shape: StampShape.scalloped,
      aspectRatio: 1,
      description: 'A stamp with decorative scalloped edges.',
    ),

    // Decorative
    StampTemplate(
      id: 'heart',
      name: 'Heart',
      category: StampCategory.decorative,
      shape: StampShape.heart,
      aspectRatio: 1,
      description: 'A heart-shaped stamp.',
    ),
    StampTemplate(
      id: 'flower',
      name: 'Flower',
      category: StampCategory.decorative,
      shape: StampShape.flower,
      aspectRatio: 1,
      description: 'A flower-shaped stamp.',
    ),
    StampTemplate(
      id: 'cloud',
      name: 'Cloud',
      category: StampCategory.decorative,
      shape: StampShape.cloud,
      aspectRatio: 1.25,
      description: 'A soft cloud-shaped stamp.',
    ),
    StampTemplate(
      id: 'arch',
      name: 'Arch',
      category: StampCategory.decorative,
      shape: StampShape.arch,
      aspectRatio: 0.8,
      description: 'A modern arch-shaped stamp.',
    ),

    // Creative
    StampTemplate(
      id: 'ticket',
      name: 'Ticket',
      category: StampCategory.creative,
      shape: StampShape.ticket,
      aspectRatio: 1.5,
      description: 'A vintage admission ticket.',
    ),
    StampTemplate(
      id: 'film_frame',
      name: 'Film Frame',
      category: StampCategory.creative,
      shape: StampShape.filmFrame,
      aspectRatio: 1.3,
      description: 'A classic film-inspired frame.',
    ),
    StampTemplate(
      id: 'rounded_rectangle',
      name: 'Rounded Rectangle',
      category: StampCategory.creative,
      shape: StampShape.roundedRectangle,
      aspectRatio: 0.85,
      description: 'A rectangle with rounded corners.',
    ),

    // Seasonal
    StampTemplate(
      id: 'spring_bloom',
      name: 'Spring Bloom',
      category: StampCategory.seasonal,
      shape: StampShape.flower,
      aspectRatio: 1,
      description: 'A floral stamp for spring memories.',
    ),
    StampTemplate(
      id: 'summer_sun',
      name: 'Summer Sun',
      category: StampCategory.seasonal,
      shape: StampShape.circle,
      aspectRatio: 1,
      description: 'A sunny circular stamp.',
    ),
    StampTemplate(
      id: 'autumn_postage',
      name: 'Autumn Postage',
      category: StampCategory.seasonal,
      shape: StampShape.postage,
      aspectRatio: 0.85,
      description: 'A postage-inspired autumn stamp.',
    ),
    StampTemplate(
      id: 'winter_snow',
      name: 'Winter Bloom',
      category: StampCategory.seasonal,
      shape: StampShape.flower,
      aspectRatio: 1,
      description: 'A decorative winter stamp.',
    ),
  ];
}

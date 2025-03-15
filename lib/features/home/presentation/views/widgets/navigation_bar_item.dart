import 'package:flutter/material.dart';
import 'package:fruit_app/features/home/domain/entities/buttom_navigation_bsr_entity.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/active_item.dart';
import 'package:fruit_app/features/home/presentation/views/widgets/in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.buttomNavigationBarEntity,
  });

  final bool isSelected;
  final ButtomNavigationBarEntity buttomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
          image: buttomNavigationBarEntity.activeImage,
          text: buttomNavigationBarEntity.name,
        )
        : InActiveItem(image: buttomNavigationBarEntity.inActiveImage);
  }
}

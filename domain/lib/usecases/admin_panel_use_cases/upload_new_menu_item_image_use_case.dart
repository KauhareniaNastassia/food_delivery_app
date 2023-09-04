import 'dart:io';

import 'package:domain/domain.dart';

class UploadNewMenuItemImageUseCase {
  final AdminPanelRepository _adminPanelRepository;

  const UploadNewMenuItemImageUseCase({
    required AdminPanelRepository adminPanelRepository,
  }) : _adminPanelRepository = adminPanelRepository;

  Future<String> uploadNewImage({
    required File uploadedMenuItemImage,
  }) async {
    return _adminPanelRepository.uploadNewImage(
      uploadedMenuItemImage: uploadedMenuItemImage,
    );
  }
}

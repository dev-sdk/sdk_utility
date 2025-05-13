part of "./index.dart";

class LengthMissMatchException extends SdkException {
  LengthMissMatchException() : super.save(SdkExceptionErrorCodes.listLengthMissMatch.code, "Length of two lists are miss matching.");
}

class AccessTokenExpiredException extends SdkException {
  AccessTokenExpiredException(String msg) : super.save(SdkExceptionErrorCodes.accessTokenExpired.code, 'Token is invalid or expired: $msg');
}

class InValidAccessTokenException extends SdkException {
  InValidAccessTokenException() : super.save(SdkExceptionErrorCodes.inValidAccessToken.code, 'Token audience does not match client ID.');
}

class FolderCreationException extends SdkException {
  FolderCreationException(String msg) : super.save(SdkExceptionErrorCodes.folderCreate.code, 'Failed to create folder: $msg');
}

class FileUploadException extends SdkException {
  FileUploadException(String msg) : super.save(SdkExceptionErrorCodes.fileUpload.code, 'Failed to upload file: $msg');
}

class FileListingException extends SdkException {
  FileListingException(String msg) : super.save(SdkExceptionErrorCodes.fileListing.code, 'Failed to list files: $msg');
}

class FileNotFoundException extends SdkException {
  FileNotFoundException(String msg) : super.save(SdkExceptionErrorCodes.fileNotFound.code, 'No files found with name $msg');
}

class FileContentException extends SdkException {
  FileContentException(String msg) : super.save(SdkExceptionErrorCodes.fileContent.code, 'Failed to read file: $msg');
}

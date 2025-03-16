class UserModel {
  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.tokenType,
    required this.accessToken,
    required this.user,
  });

  final String? tokenType;
  final String? accessToken;
  final User? user;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      tokenType: json["token_type"],
      accessToken: json["accessToken"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.birthdate,
    required this.identifierType,
    required this.nationalNumber,
    required this.passportNumber,
    required this.parentId,
    required this.parent,
    required this.children,
    required this.roleId,
    required this.role,
    required this.isOwner,
    required this.crmId,
    required this.startValidationProcess,
    required this.type,
    required this.timezone,
    required this.isSuspended,
    required this.avatar,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedAt,
    required this.deletedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.subscriptions,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? email;
  final String? phone;
  final dynamic birthdate;
  final dynamic identifierType;
  final dynamic nationalNumber;
  final dynamic passportNumber;
  final dynamic parentId;
  final dynamic parent;
  final List<Child> children;
  final int? roleId;
  final Role? role;
  final bool? isOwner;
  final dynamic crmId;
  final bool? startValidationProcess;
  final String? type;
  final String? timezone;
  final bool? isSuspended;
  final dynamic avatar;
  final int? createdBy;
  final int? updatedBy;
  final dynamic deletedAt;
  final dynamic deletedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Subscription> subscriptions;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      fullName: json["full_name"],
      email: json["email"],
      phone: json["phone"],
      birthdate: json["birthdate"],
      identifierType: json["identifier_type"],
      nationalNumber: json["national_number"],
      passportNumber: json["passport_number"],
      parentId: json["parent_id"],
      parent: json["parent"],
      children: json["children"] == null ? [] : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
      roleId: json["role_id"],
      role: json["role"] == null ? null : Role.fromJson(json["role"]),
      isOwner: json["is_owner"],
      crmId: json["crm_id"],
      startValidationProcess: json["start_validation_process"],
      type: json["type"],
      timezone: json["timezone"],
      isSuspended: json["is_suspended"],
      avatar: json["avatar"],
      createdBy: json["created_by"],
      updatedBy: json["updated_by"],
      deletedAt: json["deleted_at"],
      deletedBy: json["deleted_by"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      subscriptions: json["subscriptions"] == null ? [] : List<Subscription>.from(json["subscriptions"]!.map((x) => Subscription.fromJson(x))),
    );
  }

}

class Child {
  Child({
    required this.id,
    required this.lft,
    required this.rgt,
    required this.parentId,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.phone,
    required this.newMobile,
    required this.mobileChangeToken,
    required this.email,
    required this.newEmail,
    required this.emailChangeToken,
    required this.passwordResetToken,
    required this.passwordResetExpiresAt,
    required this.emailVerifiedAt,
    required this.phoneVerifiedAt,
    required this.birthdate,
    required this.isSuspended,
    required this.pinCode,
    required this.otp,
    required this.otpExpiresAt,
    required this.isOwner,
    required this.crmId,
    required this.startValidationProcess,
    required this.isVerified,
    required this.verificationToken,
    required this.identifierType,
    required this.nationalNumber,
    required this.passportNumber,
    required this.roleId,
    required this.timezone,
    required this.type,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
    required this.deletedAt,
    required this.deletedBy,
    required this.avatar,
    required this.media,
  });

  final int? id;
  final int? lft;
  final int? rgt;
  final int? parentId;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? phone;
  final dynamic newMobile;
  final dynamic mobileChangeToken;
  final String? email;
  final dynamic newEmail;
  final dynamic emailChangeToken;
  final dynamic passwordResetToken;
  final dynamic passwordResetExpiresAt;
  final DateTime? emailVerifiedAt;
  final dynamic phoneVerifiedAt;
  final dynamic birthdate;
  final bool? isSuspended;
  final dynamic pinCode;
  final dynamic otp;
  final dynamic otpExpiresAt;
  final bool? isOwner;
  final dynamic crmId;
  final bool? startValidationProcess;
  final bool? isVerified;
  final dynamic verificationToken;
  final dynamic identifierType;
  final dynamic nationalNumber;
  final dynamic passportNumber;
  final int? roleId;
  final String? timezone;
  final String? type;
  final DateTime? createdAt;
  final int? createdBy;
  final DateTime? updatedAt;
  final int? updatedBy;
  final dynamic deletedAt;
  final dynamic deletedBy;
  final dynamic avatar;
  final List<dynamic> media;

  factory Child.fromJson(Map<String, dynamic> json){
    return Child(
      id: json["id"],
      lft: json["_lft"],
      rgt: json["_rgt"],
      parentId: json["parent_id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      fullName: json["full_name"],
      phone: json["phone"],
      newMobile: json["new_mobile"],
      mobileChangeToken: json["mobile_change_token"],
      email: json["email"],
      newEmail: json["new_email"],
      emailChangeToken: json["email_change_token"],
      passwordResetToken: json["password_reset_token"],
      passwordResetExpiresAt: json["password_reset_expires_at"],
      emailVerifiedAt: DateTime.tryParse(json["email_verified_at"] ?? ""),
      phoneVerifiedAt: json["phone_verified_at"],
      birthdate: json["birthdate"],
      isSuspended: json["is_suspended"],
      pinCode: json["pin_code"],
      otp: json["otp"],
      otpExpiresAt: json["otp_expires_at"],
      isOwner: json["is_owner"],
      crmId: json["crm_id"],
      startValidationProcess: json["start_validation_process"],
      isVerified: json["is_verified"],
      verificationToken: json["verification_token"],
      identifierType: json["identifier_type"],
      nationalNumber: json["national_number"],
      passportNumber: json["passport_number"],
      roleId: json["role_id"],
      timezone: json["timezone"],
      type: json["type"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      createdBy: json["created_by"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      updatedBy: json["updated_by"],
      deletedAt: json["deleted_at"],
      deletedBy: json["deleted_by"],
      avatar: json["avatar"],
      media: json["media"] == null ? [] : List<dynamic>.from(json["media"]!.map((x) => x)),
    );
  }

}

class Role {
  Role({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.slug,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
    required this.deletedAt,
    required this.deletedBy,
  });

  final int? id;
  final String? nameEn;
  final String? nameAr;
  final String? slug;
  final dynamic createdAt;
  final dynamic createdBy;
  final dynamic updatedAt;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final dynamic deletedBy;

  factory Role.fromJson(Map<String, dynamic> json){
    return Role(
      id: json["id"],
      nameEn: json["name_en"],
      nameAr: json["name_ar"],
      slug: json["slug"],
      createdAt: json["created_at"],
      createdBy: json["created_by"],
      updatedAt: json["updated_at"],
      updatedBy: json["updated_by"],
      deletedAt: json["deleted_at"],
      deletedBy: json["deleted_by"],
    );
  }

}

class Subscription {
  Subscription({
    required this.id,
    required this.endDate,
    required this.userFullname,
    required this.service,
  });

  final int? id;
  final dynamic endDate;
  final String? userFullname;
  final Service? service;

  factory Subscription.fromJson(Map<String, dynamic> json){
    return Subscription(
      id: json["id"],
      endDate: json["end_date"],
      userFullname: json["user_fullname"],
      service: json["service"] == null ? null : Service.fromJson(json["service"]),
    );
  }

}

class Service {
  Service({
    required this.id,
    required this.nameEn,
  });

  final int? id;
  final String? nameEn;

  factory Service.fromJson(Map<String, dynamic> json){
    return Service(
      id: json["id"],
      nameEn: json["name_en"],
    );
  }

}

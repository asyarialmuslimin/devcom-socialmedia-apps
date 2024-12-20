class ListPostinganResponse {
    ListPostinganResponse({
        required this.id,
        required this.foto,
        required this.userId,
        required this.like,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
    });

    final int id;
    final String foto;
    final int userId;
    final int like;
    final String description;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final User? user;

    factory ListPostinganResponse.fromJson(Map<String, dynamic> json){ 
        return ListPostinganResponse(
            id: json["id"] ?? 0,
            foto: json["foto"] ?? "",
            userId: json["user_id"] ?? 0,
            like: json["like"] ?? 0,
            description: json["description"] ?? "",
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
            user: json["user"] == null ? null : User.fromJson(json["user"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "foto": foto,
        "user_id": userId,
        "like": like,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
    };

}

class User {
    User({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.emailVerifiedAt,
        required this.bio,
        required this.nomerHp,
        required this.fotoProfile,
        required this.createdAt,
        required this.updatedAt,
    });

    final int id;
    final String name;
    final String username;
    final String email;
    final dynamic emailVerifiedAt;
    final String bio;
    final String nomerHp;
    final String fotoProfile;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            id: json["id"] ?? 0,
            name: json["name"] ?? "",
            username: json["username"] ?? "",
            email: json["email"] ?? "",
            emailVerifiedAt: json["email_verified_at"],
            bio: json["bio"] ?? "",
            nomerHp: json["nomer_hp"] ?? "",
            fotoProfile: json["foto_profile"] ?? "",
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "bio": bio,
        "nomer_hp": nomerHp,
        "foto_profile": fotoProfile,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };

}

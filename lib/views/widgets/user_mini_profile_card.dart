import 'package:flutter/material.dart';

class UserMiniProfileCard {
  String _imageProfile = "";
  String _nameProfile = "";
  String _emailProfile = "";

  UserMiniProfileCard setImageProfile(String imageProfile) {
    _imageProfile = imageProfile;
    return this;
  }

  UserMiniProfileCard setNameProfile(String nameProfile) {
    _nameProfile = nameProfile;
    return this;
  }

  UserMiniProfileCard setEmailProfile(String emailProfile) {
    _emailProfile = emailProfile;
    return this;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(_imageProfile,
                fit: BoxFit.cover, width: 45, height: 45),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_nameProfile,
                  style: TextStyle(
                    fontFamily: "Lato",
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.7),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(height: 5),
              Text(_emailProfile,
                  style: const TextStyle(
                    fontFamily: "Lato",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

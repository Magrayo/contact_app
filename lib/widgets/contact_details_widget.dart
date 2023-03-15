import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'contact_detail_tile.dart';
import 'details_widget.dart';
import 'icon_card.dart';

class ContactDetailsWidget extends StatelessWidget {
  final String name;
  final Uint8List? imageUrl;
  final String number;
  final String location;
  final String? email;
  final String? group;
  const ContactDetailsWidget({
    super.key,
    required this.name,
    this.imageUrl,
    required this.number,
    required this.location,
    this.email,
    this.group,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.black),
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            size: 32,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Hero(
                tag: const Key('UserImage'),
                child: CircleAvatar(
                  radius: 50,
                  child: imageUrl == null || imageUrl!.isEmpty
                      ? const Icon(Icons.person)
                      : Image.memory(
                          imageUrl!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Text(
                location,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailsWidget(
              height: 95 * 3,
              title: 'Details',
              children: [
                ContactDetailTile(
                  title: 'Number',
                  subtitle: number,
                  trailing: SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        IconCard(icon: Icons.message),
                        SizedBox(width: 10),
                        IconCard(icon: Icons.phone),
                      ],
                    ),
                  ),
                ),
                ContactDetailTile(
                  title: 'Email',
                  subtitle: email ?? 'nil',
                  trailing: const IconCard(icon: Icons.email),
                ),
                ContactDetailTile(
                  title: 'Group',
                  subtitle: group ?? 'nil',
                  trailing: const IconCard(icon: Icons.group),
                ),
              ],
            ),
            DetailsWidget(
              height: 100 * 2,
              title: 'Account Linked',
              children: [
                ContactDetailTile(
                  title: 'Telegram',
                  subtitle: number,
                  trailing: SizedBox(
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        IconCard(
                          icon: Icons.telegram,
                          iconColor: Colors.white,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                ContactDetailTile(
                  title: 'WhatsApp',
                  subtitle: number,
                  trailing: const IconCard(
                    icon: Icons.wechat,
                    iconColor: Colors.white,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const DetailsWidget(
              height: 100 * 2,
              title: 'More Options',
              children: [
                ContactDetailTile(
                  title: 'Shared Contant',
                ),
                ContactDetailTile(
                  title: 'QR Code',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
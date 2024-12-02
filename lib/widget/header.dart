import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/custom_circle_avatar.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final bool showRepairButton; // Para controlar a exibição do botão de reparo
  final bool showAvatar; // Para controlar a exibição do avatar

  const Header({
    this.showRepairButton = true, // Exibir botão de reparo por padrão
    this.showAvatar = true, // Exibir avatar por padrão
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(
            bottom: BorderSide(
              color: MyColors.white0,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1C2BCC).withOpacity(0.12),
              offset: const Offset(0, 0),
              blurRadius: 32,
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Icon(
                PhosphorIconsRegular.coffee,
                size: 28,
                color: MyColors.primary550,
              ),
            ),
            Row(
              children: [
                if (showRepairButton)
                  StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      return PurpleButton(
                        size: ButtonSize.sm,
                        onPressed: () {
                          if (snapshot.hasData) {
                            Navigator.pushNamed(
                              context,
                              '/my-repairs',
                            );
                          } else {
                            // Usuário não está logado
                            Navigator.pushNamed(
                              context,
                              '/sign-in',
                              arguments:
                                  "É necessário possuir uma conta para acessar essa funcionalidade",
                            );
                          }
                        },
                        text: "Reparos",
                        icon: PhosphorIconsRegular.storefront,
                      );
                    },
                  ),
                const SizedBox(width: 12),
                if (showAvatar)
                  StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      return CustomCircleAvatar(
                        onTap: () {
                          if (snapshot.hasData) {
                            if (kDebugMode) {
                              print("Usuário está logado");
                            }
                            Navigator.pushNamed(context, '/edit-account');
                          } else {
                            if (kDebugMode) {
                              print("Usuário não está logado");
                            }
                            Navigator.pushNamed(context, '/sign-in');
                          }
                        },
                      );
                    },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

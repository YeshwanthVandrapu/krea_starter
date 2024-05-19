import 'package:flutter/material.dart';

class WelcomeCard extends StatefulWidget {
  const WelcomeCard({super.key});

  @override
  State<WelcomeCard> createState() => _WelcomeCardState();
}

class _WelcomeCardState extends State<WelcomeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 34.0, left: 24, top: 24, bottom: 24),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Welcome, Wahiq Iqbal',
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.waving_hand),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, top: 24, bottom: 46),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 335),
                  child: const Text(
                    'Welcome to the ERP Management System of KREA University. Access all your essential apps and resources at one place.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      // color: Color.fromARGB(1, 48, 113, 120),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        // side: const BorderSide(color: Colors.red),
                      ),
                    ),
                    backgroundColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 39, 92, 157)),
                    foregroundColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 189, 226, 238))),
                onPressed: null,
                child: const Row(
                  children: [
                    Text(
                      'Learn More',
                    ),
                    Icon(
                      Icons.open_in_new,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          const Image(image: AssetImage('res/images/image 6.png')),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class WelcomeCard extends StatefulWidget {
  const WelcomeCard({super.key});

  @override
  State<WelcomeCard> createState() => _WelcomeCardState();
}

class _WelcomeCardState extends State<WelcomeCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 24, bottom: 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome, Wahiq Iqbal ",
                        style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(Icons.waving_hand),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Flexible(
                  child: Text(
                    'Welcome to the ERP Management System of KREA University. Access all your essential apps and resources at one place.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                    overflow: TextOverflow.visible,
                    maxLines: 5,
                  ),
                ),
                const Spacer(),
                TextButton(
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 39, 92, 157)),
                    foregroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 189, 226, 238)),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Learn More'),
                      SizedBox(width: 4),
                      Icon(Icons.open_in_new),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (width > 800)
            const Expanded(
              child: Image(image: AssetImage('res/images/image 6.png')),
            ),
        ],
      ),
    );
  }
}

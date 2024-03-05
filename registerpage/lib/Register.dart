import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController NameControler = TextEditingController();
    TextEditingController EmailControler = TextEditingController();
    bool isSelected = false;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              'Registration page ',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // Name Field
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 22),
            child: TextField(
              controller: NameControler,
              decoration: InputDecoration(
                labelText: 'Name',
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Name Field over
          SizedBox(height: 10),

          // Email Field
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 22),
            child: TextField(
              controller: EmailControler,
              decoration: InputDecoration(
                labelText: 'Email Address',
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Email Field  Over

          SizedBox(height: 20),
          //Radio Button Start
          Row(
            children: [
              RadioMenuButton(
                value: isSelected == true,
                groupValue: isSelected == context,
                onChanged: (value) => (),
                child: Text('Male'),
              ),
              SizedBox(
                width: 22,
              ),
              RadioMenuButton(
                value: 'Female',
                groupValue: 'Female',
                onChanged: (value) => (),
                child: Text('Female'),
              ),
            ],
          ),

          //Radio Button Start Over
          SizedBox(
            height: 20,
          ),
          // Branch Start
          Padding(
            padding: const EdgeInsets.only(right: 350),
            child: Switch(
              value: WidgetsApp.showPerformanceOverlayOverride,
              onChanged: (value) => (),
            ),
          ),
          // Branch Start Over

          // Qualification
          Row(
            children: [
              CheckboxMenuButton(
                value: EditableText.debugDeterministicCursor,
                onChanged: (value) => {
                  isSelected == true,
                  Paint.enableDithering,
                },
                child: Text('10Th'),
              ),
              CheckboxMenuButton(
                value: EditableText.debugDeterministicCursor,
                onChanged: (value) => (),
                child: Text('12Th'),
              ),
              CheckboxMenuButton(
                value: EditableText.debugDeterministicCursor,
                onChanged: (value) => (),
                child: Text('B.TECH(Computer)'),
              ),
            ],
          ),
          //  Qualification Over
// Buttons
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {
                    ListView.builder(
                      itemBuilder: (context, index) {},
                    );
                  },
                  child: Text('Clear'),
                ),
              ),
            ],
          ),
// Buttons Over
        ],
      ),
    );
  }
}

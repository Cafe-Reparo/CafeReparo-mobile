import 'package:cafe_reparo_mobile/widget/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedItem;

  final Color primaryColor = Color(0xFF3C4DFF);
  final Color secondaryColor = Color(0xFF5060FF);
  final Color lightBackgroundColor = Color(0xFFE3E6FF);
  final Color textColor = Color(0xFF5C6089);
  final Color hintTextColor = Color(0xFFA9ABC2);

  String selectedService = 'Serviço';
  String selectedExpertise = 'Serviço';
  String selectedLocation = 'Serviço';
  bool showServiceOptions = false;
  bool showExpertiseOptions = false;
  bool showLocationOptions = false;
  bool showFilterBox = false;
  bool isProfileHovered = false;

  final List<String> options = [
    'A definir 1',
    'A definir 2',
    'A definir 3',
    'A definir 4',
    'A definir 5',
  ];

  // Lista de serviços (mockada por enquanto)
  final List<Map<String, dynamic>> services = [
    {
      'title': 'Serviço de Pintura',
      'location': 'São Paulo - SP',
      'description':
          'Oferecemos serviços de pintura residencial e comercial com qualidade garantida.',
      'expertise': ['Pintura', 'Interior', 'Exterior'],
    },
    {
      'title': 'Reparo Hidráulico',
      'location': 'Rio de Janeiro - RJ',
      'description':
          'Reparos em encanamentos, torneiras e sistemas de esgoto com atendimento rápido.',
      'expertise': ['Hidráulica', 'Manutenção', 'Emergencial'],
    },
    {
      'title': 'Conserto de Eletrônicos',
      'location': 'Belo Horizonte - MG',
      'description':
          'Reparamos celulares, computadores e outros dispositivos eletrônicos.',
      'expertise': ['Eletrônicos', 'Reparo', 'Garantia'],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Header(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Olá Ana,',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            Text(
              'O que vamos reparar hoje?',
              style: TextStyle(
                fontSize: 24,
                color: primaryColor,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: lightBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: primaryColor),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: hintTextColor),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list, color: primaryColor),
                    onPressed: () {
                      setState(() {
                        showFilterBox = !showFilterBox;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (showFilterBox) buildFilterBox(),
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return buildServiceCard(service);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Botão flutuante clicado!');
        },
        backgroundColor: primaryColor,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget buildFilterBox() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDropdownField(
            label: 'Nome do Serviço',
            icon: Icons.store,
            selectedItem: selectedService,
            showOptions: showServiceOptions,
            onTap: () {
              setState(() {
                showServiceOptions = !showServiceOptions;
                showExpertiseOptions = false;
                showLocationOptions = false;
              });
            },
            onSelected: (value) {
              setState(() {
                selectedService = value;
                showServiceOptions = false;
              });
            },
          ),
          buildDropdownField(
            label: 'Expertise',
            icon: Icons.build,
            selectedItem: selectedExpertise,
            showOptions: showExpertiseOptions,
            onTap: () {
              setState(() {
                showExpertiseOptions = !showExpertiseOptions;
                showServiceOptions = false;
                showLocationOptions = false;
              });
            },
            onSelected: (value) {
              setState(() {
                selectedExpertise = value;
                showExpertiseOptions = false;
              });
            },
          ),
          buildDropdownField(
            label: 'Localização',
            icon: Icons.location_on,
            selectedItem: selectedLocation,
            showOptions: showLocationOptions,
            onTap: () {
              setState(() {
                showLocationOptions = !showLocationOptions;
                showServiceOptions = false;
                showExpertiseOptions = false;
              });
            },
            onSelected: (value) {
              setState(() {
                selectedLocation = value;
                showLocationOptions = false;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildServiceCard(Map<String, dynamic> service) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            service['title'],
            style: TextStyle(
              color: primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            service['location'],
            style: TextStyle(
              color: hintTextColor,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 8),
          Text(
            service['description'],
            style: TextStyle(
              color: textColor,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: (service['expertise'] as List<String>)
                .map(
                  (expertise) => Chip(
                    label: Text(
                      expertise,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: primaryColor,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildDropdownField({
    required String label,
    required IconData icon,
    required String selectedItem,
    required bool showOptions,
    required VoidCallback onTap,
    required ValueChanged<String> onSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: lightBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(icon, color: primaryColor),
                SizedBox(width: 10),
                Text(
                  selectedItem,
                  style: TextStyle(color: primaryColor, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        if (showOptions)
          Container(
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: options.map((option) {
                return ListTile(
                  title: Text(
                    option,
                    style: TextStyle(color: primaryColor),
                  ),
                  onTap: () {
                    onSelected(option);
                  },
                );
              }).toList(),
            ),
          ),
        SizedBox(height: 16),
      ],
    );
  }
}

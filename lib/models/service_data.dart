// Representa um contato com nome da plataforma e o link
class Contact {
  final String platform; // Nome da plataforma (Ex: Instagram, WhatsApp)
  final String link; // Link de acesso para a plataforma (Ex: URL do Instagram)

  Contact({required this.platform, required this.link});

  // Método para converter um Contact para JSON
  Map<String, dynamic> toJson() {
    return {
      'platform': platform,
      'link': link,
    };
  }
}

class Location {
  final String city; // Nome da cidade
  final String street; // Nome da rua
  final String number; // Número da casa ou apartamento

  Location({required this.city, required this.street, required this.number});

  String getFormattedAddress() {
    return "$city, $street, $number";
  }
}

// Classe que contém os dados do serviço, incluindo contatos
class ServiceData {
  final String? serviceName;
  final List<String>? expertise;
  final String? description;
  final String? email;
  final List<Contact>? contacts;
  final Location? location;

  ServiceData({
    this.serviceName,
    this.expertise,
    this.description,
    this.email,
    this.contacts,
    this.location,
  });

  // Método para converter o ServiceData para JSON
  Map<String, dynamic> toJson() {
    return {
      'name': serviceName,
      'tags': expertise,
      'description': description,
      'location': location?.getFormattedAddress(),
      'contacts': contacts
          ?.map((contact) => contact.toJson())
          .toList(), // Converte a lista de contatos para JSON
    };
  }
}

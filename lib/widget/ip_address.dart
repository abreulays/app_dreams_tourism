import 'dart:io';

Future<String> getIpAddress() async {
  String ipAddress = 'Não foi possível obter o endereço IP';

  try {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4) {
          ipAddress = addr.address;
        }
      }
    }
  } catch (e) {
    print('Erro ao obter o endereço IP: $e');
  }

  return ipAddress;
}

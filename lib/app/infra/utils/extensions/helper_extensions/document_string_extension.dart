extension BrazilianDocumentFormatter on String {
  bool _isCpf() {
    if (length != 11 || int.tryParse(this) == null) return false;

    return true;
  }

  bool _isCnpj() {
    if (length != 14 || int.tryParse(this) == null) return false;
    return true;
  }

  String formatCpf() {
    if (!_isCpf()) return this;
    return '${substring(0, 3)}.${substring(3, 6)}.${substring(6, 9)}-${substring(9, 11)}';
  }

  String formatCnpj() {
    if (!_isCnpj()) return this;
    return '${substring(0, 2)}.${substring(2, 5)}.${substring(5, 8)}/${substring(8, 12)}-${substring(12, 14)}';
  }

  String formatBrazilianDocument() {
    if (_isCpf()) return formatCpf();
    if (_isCnpj()) return formatCnpj();
    return this;
  }
}

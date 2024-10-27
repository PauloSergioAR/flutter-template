import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskFormatter {
  MaskFormatter._();
  static final dateValidate = MaskTextInputFormatter(mask: '##/##/####');
  static final cepValidate = MaskTextInputFormatter(mask: '#####-###');
  static final dateHourValidate = MaskTextInputFormatter(
    mask: '##/##/#### - ##:##',
  );
  static final phone = MaskTextInputFormatter(mask: '## #####-####');
  static final cpf = MaskTextInputFormatter(mask: '###.###.###-##');
  static final cnpj = MaskTextInputFormatter(mask: '##.###.###/####-##');
}

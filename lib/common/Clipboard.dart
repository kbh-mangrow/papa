import 'dart:async';
import 'dart:html' as html;

/// Flutter Web용 클립보드 유틸
/// Safari iOS 호환 포함
class Clipboard {
  Clipboard._(); // 인스턴스화 방지

  /// 텍스트 복사
  static Future<bool> copy(String text) async {
    try {
      // 표준 API
      await html.window.navigator.clipboard?.writeText(text);
      return true;
    } catch (_) {
      // fallback (iOS Safari 등)
      try {
        final textArea = html.TextAreaElement();
        textArea.value = text;
        html.document.body!.append(textArea);
        textArea.select();
        final success = html.document.execCommand('copy');
        textArea.remove();
        return success;
      } catch (e) {
        print('Clipboard copy failed: $e');
        return false;
      }
    }
  }

  /// 텍스트 붙여넣기
  /// iOS Safari는 제한적이므로 fallback 사용
  static Future<String> paste() async {
    try {
      // 표준 API
      return await html.window.navigator.clipboard?.readText() ?? '';
    } catch (_) {
      // fallback (iOS Safari)
      final textArea = html.TextAreaElement();
      html.document.body!.append(textArea);
      textArea.focus();
      final success = html.document.execCommand('paste');
      final pastedText = textArea.value ?? '';
      textArea.remove();
      if (!success) {
        print('Clipboard paste fallback may not be supported on iOS Safari');
      }
      return pastedText;
    }
  }
}
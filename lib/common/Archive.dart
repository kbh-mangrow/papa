import 'dart:async';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:html' as html;
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import 'Log.dart';


class Archive {
  static Future<PackageInfo> getPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }
  static Future<String> getAppName() async {
    PackageInfo packageInfo = await getPackageInfo();
    return packageInfo.appName;
  }
  static Future<String> getPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }
  static Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
  static Future<String> getBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }
  static String getDeviceInfoAsString() {
    final userAgent = html.window.navigator.userAgent;
    String browser = 'Unknown';
    String os = 'Unknown';
    String deviceType = 'Desktop';
    String version = 'Unknown';

    // Determine OS
    if (userAgent.contains('Win')) {
      os = 'Windows';
    } else if (userAgent.contains('Mac')) {
      os = 'macOS';
    } else if (userAgent.contains('Linux')) {
      os = 'Linux';
    } else if (userAgent.contains('Android')) {
      os = 'Android';
    } else if (userAgent.contains('iPhone') || userAgent.contains('iPad') || userAgent.contains('iPod')) {
      os = 'iOS';
    }

    // Determine Device Type
    if (userAgent.contains('Mobile')) {
      deviceType = 'Mobile';
    } else if (userAgent.contains('Tablet')) {
      deviceType = 'Tablet';
    }

    // Determine Browser and Version
    if (userAgent.contains('Edg')) {
      browser = 'Microsoft Edge';
      final match = RegExp(r'Edg/(\d+\.\d+)').firstMatch(userAgent);
      if (match != null) {
        version = match.group(1)!;
      }
    } else if (userAgent.contains('Chrome') && !userAgent.contains('Edg')) {
      browser = 'Chrome';
      final match = RegExp(r'Chrome/(\d+\.\d+)').firstMatch(userAgent);
      if (match != null) {
        version = match.group(1)!;
      }
    } else if (userAgent.contains('Firefox')) {
      browser = 'Firefox';
      final match = RegExp(r'Firefox/(\d+\.\d+)').firstMatch(userAgent);
      if (match != null) {
        version = match.group(1)!;
      }
    } else if (userAgent.contains('Safari') && !userAgent.contains('Chrome')) {
      browser = 'Safari';
      final match = RegExp(r'Version/(\d+\.\d+)').firstMatch(userAgent);
      if (match != null) {
        version = match.group(1)!;
      }
    }

    return '$browser,$os,$deviceType,$version';
  }

  static Future<String> getDeviceUniqueId() async {
    // 기본 디바이스 정보
    final userAgent = getDeviceInfoAsString();
    final platform = html.window.navigator.platform ?? 'unknown';
    final language = html.window.navigator.language ?? 'unknown';
    final languages = html.window.navigator.languages?.join(',') ?? 'unknown';
    final vendor = html.window.navigator.vendor;
    final hardwareConcurrency = html.window.navigator.hardwareConcurrency?.toString() ?? 'unknown';
    final screenWidth = html.window.screen?.width.toString() ?? 'cx';
    final screenHeight = html.window.screen?.height.toString() ?? 'cy';
    final colorDepth = html.window.screen?.colorDepth.toString() ?? 'unknown';
    final timezoneOffset = DateTime.now().timeZoneOffset.inMinutes.toString();
    final cookieEnabled = html.window.navigator.cookieEnabled.toString();

    // 캔버스 fingerprint
    String canvasFingerprint = '';
    try {
      final canvas = html.CanvasElement(width: 200, height: 200);
      final ctx = canvas.getContext('2d') as html.CanvasRenderingContext2D;
      ctx.textBaseline = 'top';
      ctx.font = '14px Arial';
      ctx.fillText('Hello, World!', 2, 2);
      canvasFingerprint = canvas.toDataUrl('image/png');
    } catch (e) {
      canvasFingerprint = 'canvas_error';
    }

    // WebGL fingerprint
    String webglRenderer = 'unknown';
    String webglVendor = 'unknown';
    try {
      final canvas = html.CanvasElement();
      final gl = canvas.getContext('webgl') as dynamic;
      if (gl != null) {
        webglRenderer = gl.getParameter(gl.RENDERER);
        webglVendor = gl.getParameter(gl.VENDOR);
      }
    } catch (e) {}

    // IP 주소 가져오기
    String ipAddress = await getIpAddress() ?? 'unknown_ip';

    // 결합하여 고유 문자열 생성
    final rawFingerprint = [
      userAgent,
      platform,
      language,
      languages,
      vendor,
      hardwareConcurrency,
      screenWidth,
      screenHeight,
      colorDepth,
      timezoneOffset,
      cookieEnabled,
      //canvasFingerprint,
      //webglRenderer,
      //webglVendor,
      ipAddress, // 여기에 IP 추가됨
    ].join('|');

    // SHA-256 해시 생성
    Log.d('Archive', rawFingerprint);
    //Safari,macOS,Mobile,18.6|iPhone|ko-KR|ko-KR|Apple Computer, Inc.|4|375|667|24|540|true|121.134.32.175
    final bytes = utf8.encode(rawFingerprint);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static Future<String?> getIpAddress() async {
    try {
      final response = await http.get(Uri.parse('https://api.ipify.org?format=json'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['ip'];
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching IP: $e');
      return null;
    }
  }
}
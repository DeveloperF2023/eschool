String formatTime(String time) {
  final parts = time.split(':');
  if (parts.length < 2) return time;
  final hour = parts[0].padLeft(2, '0');
  final minute = parts[1].padLeft(2, '0');
  return '$hour:$minute';
}

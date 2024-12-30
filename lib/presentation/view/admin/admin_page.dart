import 'package:btc_price_app/presentation/viewmodel/indicator_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:btc_price_app/core/theme.dart';

class AdminPage extends ConsumerStatefulWidget {
  const AdminPage({super.key});

  @override
  ConsumerState<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends ConsumerState<AdminPage> {
  final _mvrvController = TextEditingController();
  bool _isUpdating = false;

  @override
  void dispose() {
    _mvrvController.dispose();
    super.dispose();
  }

  Future<void> _createMvrv() async {
    if (_mvrvController.text.isEmpty) return;
    setState(() => _isUpdating = true);

    try {
      final value = double.parse(_mvrvController.text);
      await ref.read(indicatorViewModelProvider.notifier).createMvrv(value);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('새 MVRV 값이 생성되었습니다')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('생성 실패: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isUpdating = false);
    }
  }

  Future<void> _updateMvrv() async {
    if (_mvrvController.text.isEmpty) return;
    setState(() => _isUpdating = true);

    try {
      final value = double.parse(_mvrvController.text);
      await ref.read(indicatorViewModelProvider.notifier).updateMvrv(value);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('MVRV 값이 업데이트되었습니다')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('업데이트 실패: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isUpdating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.appBarColor,
        title: const Text('관리자 설정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'MVRV 관리',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _mvrvController,
              decoration: const InputDecoration(
                labelText: 'MVRV 값',
                border: OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isUpdating ? null : _createMvrv,
                    child: _isUpdating
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('새 값 생성'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isUpdating ? null : _updateMvrv,
                    child: _isUpdating
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('최근 값 수정'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:notification_center/notification_center.dart';

void main() {
  test('add new observer should be success', () {
    NotificationCenter.addObserver(
      observer: 'testObserver',
      name: 'test',
      block: (_) {},
    );

    expect(NotificationCenter.hasObserver(observer: 'testObserver'), isTrue);
    expect(NotificationCenter.hasObserver(observer: 'observer'), isFalse);
  });

  test('observer should be notified when post', () {
    NotificationCenter.addObserver(
      observer: 'testObserver',
      name: 'test',
      block: (content) {
        expect(content, 'testContent');
      },
    );

    NotificationCenter.post(
      name: 'test',
      param: 'testContent',
    );
  });

  test('remove observer should be success', () {
    NotificationCenter.addObserver(
      observer: 'testObserver',
      name: 'test',
    );

    expect(NotificationCenter.hasObserver(observer: 'testObserver'), isTrue);

    NotificationCenter.removeObserver(observer: 'testObserver');

    expect(NotificationCenter.hasObserver(observer: 'testObserver'), isFalse);
  });
}

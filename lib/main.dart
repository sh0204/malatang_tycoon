import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

void main() {
  runApp(GameWidget(game: MalatangTycoonGame()));
}

class MalatangTycoonGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // TODO: Implement game loading logic here
    // 임시 배경색 설정
    camera.backdrop.add(
      RectangleComponent(
        size: size,
        paint: Paint()..color = const Color(0xFFF5E6CC), // 따뜻한 베이지색
      ),
    );

    // 상단 손님 영역 (화면 상단 25%)
    add(
      RectangleComponent(
        size: Vector2(size.x, size.y * 0.25),
        position: Vector2(0, 0),
        paint: Paint()..color = const Color(0xFFADD8E6), // 연한 파란색
      ),
    );

    // 상단 손님 영역 내 요리사 캐릭터 (임시)
    final chefSize = size.y * 0.15; // 상단 영역 높이의 60% 정도
    add(
      RectangleComponent(
        size: Vector2(chefSize, chefSize),
        position: Vector2(size.x * 0.1, size.y * 0.05), // 상단 영역 내 왼쪽
        paint: Paint()..color = const Color(0xFFDDA0DD), // 보라색 (임시)
      ),
    );

    // 상단 손님 영역 내 말풍선 (임시)
    final speechBubbleWidth = size.x * 0.4;
    final speechBubbleHeight = size.y * 0.1;
    add(
      RectangleComponent(
        size: Vector2(speechBubbleWidth, speechBubbleHeight),
        position: Vector2(size.x * 0.3, size.y * 0.07), // 요리사 옆
        paint: Paint()..color = const Color(0xFFFFFFFF), // 흰색 (임시)
      ),
    );

    // 중앙 조리대 (화면 중앙 50%)
    add(
      RectangleComponent(
        size: Vector2(size.x, size.y * 0.50),
        position: Vector2(0, size.y * 0.25),
        paint: Paint()..color = const Color(0xFF90EE90), // 연한 녹색
      ),
    );

    // 하단 재료 바 (화면 하단 25%) - 색상 변경 및 슬롯 추가
    final bottomBarHeight = size.y * 0.25;
    final bottomBarY = size.y * 0.75;
    add(
      RectangleComponent(
        size: Vector2(size.x, bottomBarHeight),
        position: Vector2(0, bottomBarY),
        paint: Paint()..color = const Color(0xFF8B4513), // 나무 질감에 가까운 갈색
      ),
    );

    // 재료 아이콘 슬롯 및 맵기 단계 슬롯 (임시)
    final slotSize = bottomBarHeight * 0.7; // 하단 바 높이의 70%
    final verticalPadding = (bottomBarHeight - slotSize) / 2;
    final horizontalSpacing = size.x * 0.02; // 화면 너비의 2%를 간격으로

    double currentX = horizontalSpacing; // 첫 슬롯의 시작 X 위치

    for (int i = 0; i < 5; i++) { // 5개의 재료 슬롯
      add(
        RectangleComponent(
          size: Vector2(slotSize, slotSize),
          position: Vector2(
            currentX,
            bottomBarY + verticalPadding,
          ),
          paint: Paint()..color = const Color(0xFFFFFFFF), // 흰색
        ),
      );
      currentX += slotSize + horizontalSpacing;
    }

    // 맵기 단계 선택 슬롯 (임시)
    add(
      RectangleComponent(
        size: Vector2(slotSize, slotSize),
        position: Vector2(
          currentX,
          bottomBarY + verticalPadding,
        ),
        paint: Paint()..color = const Color(0xFFFF0000), // 빨간색
      ),
    );

    // 중앙 조리대 내 마라탕 냄비 (임시) - 보글보글 효과 및 그라데이션 적용
    final potSize = size.y * 0.4;
    final potPosition = Vector2(size.x * 0.1, size.y * 0.3);
    add(
      RectangleComponent(
        size: Vector2(potSize, potSize),
        position: potPosition,
        paint: Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFF9800), // Orange
              const Color(0xFFF44336), // Red
            ],
          ).createShader(Rect.fromLTWH(0, 0, potSize, potSize)),
      ),
    );

    // 중앙 조리대 내 재료 도마 (임시)
    add(
      RectangleComponent(
        size: Vector2(size.y * 0.4, size.y * 0.4), // 대략적인 크기
        position: Vector2(size.x * 0.5, size.y * 0.3), // 중앙 조리대 영역 내 오른쪽 중앙
        paint: Paint()..color = const Color(0xFFA0522D), // 갈색
      ),
    );
    return super.onLoad();
  }
}

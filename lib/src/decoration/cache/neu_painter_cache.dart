
import '../../../flutter_neu.dart';
import 'neu_abstract_painter_cache.dart';

class NeumorphicPainterCache extends NeuAbstractEmbossPainterCache {
  @override
  Color generateShadowDarkColor(
      {required Color color, required double intensity}) {
    return NeuColors.decorationDarkColor(color, intensity: intensity);
  }

  @override
  Color generateShadowLightColor(
      {required Color color, required double intensity}) {
    return NeuColors.decorationWhiteColor(color, intensity: intensity);
  }

  @override
  void updateTranslations() {
    //no-op, used only for emboss
  }

  @override
  Rect updateLayerRect({required Offset newOffset, required Size newSize}) {
    return Rect.fromLTRB(
      originOffset.dx - newSize.width,
      originOffset.dy - newSize.height,
      originOffset.dx + 2 * newSize.width,
      originOffset.dy + 2 * newSize.height,
    );
  }
}

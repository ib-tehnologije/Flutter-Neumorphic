import '../../flutter_neu.dart';
import 'neu_rrect_path_provider.dart';

class NeuStadiumPathProvider extends NeuRRectPathProvider {
  const NeuStadiumPathProvider({Listenable? reclip})
      : super(
            const BorderRadius.all(
              const Radius.circular(1000),
            ),
            reclip: reclip);
}

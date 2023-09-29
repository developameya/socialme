import 'package:beamer/beamer.dart';
import 'package:socialme/src/core/common/widgets/error_page.dart';
import 'package:socialme/src/features/authentication/location.dart';

///common route delegate function for all the features
BeamerDelegate routeDelegate() => BeamerDelegate(
      initialPath: '/',
      notFoundPage: const BeamPage(
        child: ErrorPage(message: 'Page Not found!!'),
      ),
      locationBuilder: BeamerLocationBuilder(
        beamLocations: [
          //TODO: create location for home page (newsfeed)
          // HomeLocation(),
          AuthLocation(),
        ],
      ),
      guards: [
        //TODO: create guards
      ],
    );

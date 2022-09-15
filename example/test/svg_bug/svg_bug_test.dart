import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  autoUpdateGoldenFiles = true;

  final fakeAssetBundle = FakeAssetBundle();

  final constraints = BoxConstraints.loose(const Size.square(1000));

  Widget buildWidget() => SvgPicture.asset(
        'foo',
        bundle: fakeAssetBundle,
      );

  testWidgets(
    'SvgPicture.asset manual golden test',
    (WidgetTester tester) async {
      await tester.pumpWidget(buildWidget());
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(SvgPicture),
        matchesGoldenFile('svg_test_manual.png'),
      );
    },
  );

  goldenTest(
    'SvgPicture.asset alchemist golden test with group',
    fileName: 'svg_test_alchemist_with_group',
    builder: () => GoldenTestGroup(
      scenarioConstraints: constraints,
      children: [
        GoldenTestScenario(
          constraints: constraints,
          name: '''GoldenTestGroup\n'''
              '''    -> GoldenTestScenario\n'''
              '''        -> SvgPicture''',
          child: buildWidget(),
        ),
        GoldenTestScenario(
          constraints: constraints,
          name: '''GoldenTestGroup\n'''
              '''    -> GoldenTestScenario\n'''
              '''        -> Center\n'''
              '''            -> SvgPicture''',
          child: Center(child: buildWidget()),
        ),
      ],
    ),
  );

  goldenTest(
    'SvgPicture.asset alchemist golden test without GoldenTestGroup and without center',
    fileName: 'svg_test_alchemist_without_group_without_center',
    constraints: constraints,
    builder: () => buildWidget(),
  );

  goldenTest(
    'SvgPicture.asset alchemist golden test without GoldenTestGroup and with center',
    fileName: 'svg_test_alchemist_without_group_with_center',
    constraints: constraints,
    builder: () => Center(child: buildWidget()),
  );
}

class FakeAssetBundle extends Fake implements AssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    return stickFigureSvgStr;
  }
}

const String stickFigureSvgStr = '''
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->
<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://web.resource.org/cc/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   width="170"
   height="240"
   id="svg2"
   sodipodi:version="0.32"
   inkscape:version="0.45"
   version="1.0"
   sodipodi:docbase="/home/liblit/Desktop"
   sodipodi:docname="Stick_Figure.svg"
   inkscape:output_extension="org.inkscape.output.svg.inkscape"
   sodipodi:modified="true">
  <defs
     id="defs4" />
  <sodipodi:namedview
     id="base"
     pagecolor="#ffffff"
     bordercolor="#666666"
     borderopacity="1.0"
     gridtolerance="10000"
     guidetolerance="10"
     objecttolerance="10"
     inkscape:pageopacity="0.0"
     inkscape:pageshadow="2"
     inkscape:zoom="2.4564104"
     inkscape:cx="54.676472"
     inkscape:cy="97.499992"
     inkscape:document-units="px"
     inkscape:current-layer="layer2"
     inkscape:guide-points="false"
     inkscape:grid-points="false"
     showgrid="false"
     inkscape:object-bbox="true"
     inkscape:object-points="true"
     inkscape:object-nodes="true"
     inkscape:window-width="1024"
     inkscape:window-height="693"
     inkscape:window-x="0"
     inkscape:window-y="25"
     width="170px"
     height="240px" />
  <metadata
     id="metadata7">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <g
     inkscape:groupmode="layer"
     id="layer2"
     inkscape:label="Lines">
    <g
       id="g6721"
       transform="translate(-258.38235,-359.68572)">
      <path
         id="path3796"
         d="M 289.70588,466.47983 L 345.58824,482.95042 L 397.05882,465.59748"
         style="fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
      <path
         id="path3798"
         d="M 305,576.18571 L 345.88235,515.89159 L 377.64706,575.59748"
         style="fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
      <path
         id="path3800"
         d="M 345.9104,516.00089 L 345.9104,451.63338"
         style="fill:none;fill-opacity:0.75;fill-rule:evenodd;stroke:#000000;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1" />
      <path
         transform="translate(22.352941,-12.411765)"
         d="M 361.49863 429.93896 A 37.282658 34.34148 0 1 1  286.93332,429.93896 A 37.282658 34.34148 0 1 1  361.49863 429.93896 z"
         sodipodi:ry="34.34148"
         sodipodi:rx="37.282658"
         sodipodi:cy="429.93896"
         sodipodi:cx="324.21597"
         id="path3802"
         style="opacity:1;fill:none;fill-opacity:1;fill-rule:nonzero;stroke:#000000;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:100;stroke-dasharray:none;stroke-opacity:1"
         sodipodi:type="arc" />
      <path
         transform="translate(12.880335,-19.248572)"
         d="M 330.1751 429.93896 A 5.9591279 5.9591279 0 1 1  318.25684,429.93896 A 5.9591279 5.9591279 0 1 1  330.1751 429.93896 z"
         sodipodi:ry="5.9591279"
         sodipodi:rx="5.9591279"
         sodipodi:cy="429.93896"
         sodipodi:cx="324.21597"
         id="path5746"
         style="opacity:1;fill:none;fill-opacity:1;fill-rule:nonzero;stroke:#000000;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:100;stroke-dasharray:none;stroke-opacity:1"
         sodipodi:type="arc" />
      <path
         transform="translate(32.439159,-19.248572)"
         d="M 330.1751 429.93896 A 5.9591279 5.9591279 0 1 1  318.25684,429.93896 A 5.9591279 5.9591279 0 1 1  330.1751 429.93896 z"
         sodipodi:ry="5.9591279"
         sodipodi:rx="5.9591279"
         sodipodi:cy="429.93896"
         sodipodi:cx="324.21597"
         id="path5748"
         style="opacity:1;fill:none;fill-opacity:1;fill-rule:nonzero;stroke:#000000;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:100;stroke-dasharray:none;stroke-opacity:1"
         sodipodi:type="arc" />
      <path
         sodipodi:open="true"
         sodipodi:end="2.2600247"
         sodipodi:start="0.87001508"
         transform="matrix(0.9995118,-3.1243063e-2,3.1243063e-2,0.9995118,9.3957979,-16.053504)"
         d="M 344.35227,455.7106 A 31.228014,33.717564 0 0 1 304.35677,455.96005"
         sodipodi:ry="33.717564"
         sodipodi:rx="31.228014"
         sodipodi:cy="429.93896"
         sodipodi:cx="324.21597"
         id="path5750"
         style="opacity:1;fill:none;fill-opacity:1;fill-rule:nonzero;stroke:#000000;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:100;stroke-dasharray:none;stroke-opacity:1"
         sodipodi:type="arc" />
    </g>
  </g>
</svg>
''';

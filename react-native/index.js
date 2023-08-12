import ScuffedRenderer from "./scuffedRenderer";

module.exports = {
  Text: "Text",
  View: "View",
  AppRegistry: {
    registerComponent: (appName, rootCompoentWithTooManyLayers, callback) => {
      /**
       * React native is a bit weird, it doesn't render the root component
       * directly but instead asks for a callback to the function that returns
       * a function that returns the root component. Nice.
       */
      const rootComponent = rootCompoentWithTooManyLayers()();

      // yeah i used var, what are you gonna do about it
      var containerForTheRootCOmponetnYayyyyy = ScuffedRenderer.createContainer(
        rootComponent,
        0,
        callback,
        false
      );

      return ScuffedRenderer.updateContainer(
        rootComponent,
        containerForTheRootCOmponetnYayyyyy
      );
    },
  },
};

const Reconciler = require("react-reconciler");

let rootHostContext = {};
// 😱
var childHostContext = {};

/** @type {Reconciler.HostConfig} */
const hostConfig = {
  getRootHostContext: () => rootHostContext,
  getChildHostContext: () => childHostContext,
  prepareForCommit: () => console.log("prepareForCommit"),
  resetAfterCommit: () => console.log("resetAfterCommit"),
  shouldSetTextContent: () => {
    console.log("shouldSetTextContent");
    return false;
  },
  createTextInstance: (text) => ScuffedUIManager.createTextInstance(text),
  // createInstance: (type, props) =>
  //   console.log(`createInstance ${type} ${JSON.stringify(props)}`),
  createInstance: (type, props) => ScuffedUIManager.createInstance(type, props),
  appendInitialChild: () => console.log("appendInitialChild"),
  finalizeInitialChildren: () => {
    console.log("finalizeInitialChildren");
    return false;
  },
  createContainerChildSet: () => {
    console.log("createContainerChildSet");
    return new Set();
  },
  appendChildToContainerChildSet: () =>
    console.log("appendChildToContainerChildSet"),
  finalizeContainerChildren: () => console.log("finalizeContainerChildren"),
  replaceContainerChildren: () => console.log("replaceContainerChildren"),
  getPublicInstance: () => console.log("getPublicInstance"),
  // We use persistence mode since we will be treating the host tree as
  // immutable.
  supportsMutation: false,
  supportsPersistence: true,
};

export default Reconciler(hostConfig);

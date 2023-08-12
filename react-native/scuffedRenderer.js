const Reconciler = require("react-reconciler");

let rootHostContext = {};
// 😱
var childHostContext = {};

/** @type {Reconciler.HostConfig} */
const hostConfig = {
  getRootHostContext: () => console.log("getRootHostContext"),
  prepareForCommit: () => console.log("prepareForCommit"),
  resetAfterCommit: () => console.log("resetAfterCommit"),
  getChildHostContext: () => console.log("getChildHostContext"),
  shouldSetTextContent: () => {
    console.log("shouldSetTextContent");
    return false;
  },
  createTextInstance: () => console.log("createTextInstance"),
  createInstance: () => console.log("createInstance"),
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

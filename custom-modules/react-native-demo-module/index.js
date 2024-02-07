// prettier-ignore
import { NativeModules, NativeEventEmitter } from 'react-native';

const DemoModule = NativeModules.DemoModule;

export function startEligibleForGroupSession() {
  return DemoModule.subscriberEligibleForGroupSession();
}

export function eligibleForGroupSessionEventEmitter() {
  return new NativeEventEmitter(DemoModule);
}

// prettier-ignore
import { NativeModules } from 'react-native';

const DemoModule = NativeModules.DemoModule;

export function getElegibleForGroupSession() {
  return DemoModule.getElegibleForGroupSession();
}

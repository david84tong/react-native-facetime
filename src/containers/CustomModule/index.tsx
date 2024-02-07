import React, {useEffect, useState} from 'react';
import {View} from 'react-native';
import {
  startEligibleForGroupSession,
  eligibleForGroupSessionEventEmitter,
} from 'react-native-demo-module';
import styles from './styles';

// Components
import TextView from '../../components/TextView';

const CustomModule = () => {
  const [isElegibleForGroupSession, setElegibleForGroupSessio] =
    useState(false);

  useEffect(() => {
    eligibleForGroupSessionEventEmitter().addListener(
      'onEligibilityChange',
      event => {
        console.log('Received event:', event);
        setElegibleForGroupSessio(event);
      },
    );
    startEligibleForGroupSession();
  }, []);

  return (
    <View style={styles.container}>
      <View style={styles.valueSection}>
        <TextView
          text={`isElegibleForGroupSession: ${isElegibleForGroupSession}`}
        />
      </View>
    </View>
  );
};

export default CustomModule;

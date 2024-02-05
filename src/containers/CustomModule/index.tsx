import React, {useState} from 'react';
import {View} from 'react-native';
import {getElegibleForGroupSession} from 'react-native-demo-module';
import styles from './styles';

// Components
import TextView from '../../components/TextView';
import ButtonView from '../../components/ButtonView';

const CustomModule = () => {
  const [isElegibleForGroupSession, setElegibleForGroupSessio] =
    useState(false);

  const handleElegibleForGroupSession = async () => {
    try {
      const bElegibleForGroupSession = await getElegibleForGroupSession();
      console.log('isElegibleForGroupSession ' + bElegibleForGroupSession);
      setElegibleForGroupSessio(bElegibleForGroupSession);
    } catch (e) {
      console.log(e);
    }
  };

  return (
    <View style={styles.container}>
      <View style={styles.valueSection}>
        <TextView
          text={`isElegibleForGroupSession: ${isElegibleForGroupSession}`}
        />
      </View>

      <ButtonView
        text={'Detect location'}
        onPress={handleElegibleForGroupSession}
      />
    </View>
  );
};

export default CustomModule;

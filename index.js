import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  NativeModules,
  Button
} from 'react-native';

const HelloWorld = () => {
  const sendValueString = () => {
    const manager = NativeModules.NativeCounterManager
    const strValue = '1234'
    manager.sendValue(strValue)
  }

  const sendValueInt = () => {
    const manager = NativeModules.NativeCounterManager
    const intValue = 5678
    manager.sendValueInt(intValue)
  }

  const increment = () => {
    const manager = NativeModules.NativeCounterManager
    manager.increment(value => {
      console.log('increment : ' + value)
    })
  }

  const decrement = () => {
    const manger = NativeModules.NativeCounterManager
    manger.decrement().then(result => {
      console.log('decrement : ' + result)
    }).catch(e => {
      console.log(e.message)
    })
  }

  return (
    <View style={styles.container}>
      <Text style={styles.hello}>Hello, World2</Text>
      <Button title='Move Product Detail' onPress={sendValueString}/>
      <Button title='Move QA Detail' onPress={sendValueInt}/>
      <Button title='Increment CallBack' onPress={increment} />
      <Button title='Decrement' onPress={decrement} />
    </View>
  );
};
var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center'
  },
  hello: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10
  }
});

AppRegistry.registerComponent(
  'IntegrationProject',
  () => HelloWorld
);
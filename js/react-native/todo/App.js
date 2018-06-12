import React from 'react';
import { StyleSheet, Text, View, SectionList, Button, TextInput, FlatList } from 'react-native';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { todos: [{ title: 'hoge' }, { title: 'hoge2' }] };
    this.onPressAddTodo = this.onPressAddTodo.bind(this);
    this.changeText = this.changeText.bind(this)
  }

  onPressAddTodo() {
    const task = {
      title: this.state.text
    }

    this.setState({
      todos: [...this.state.todos, task]
    });
  }

  changeText(text) {
    this.setState({ text })
  }

  render() {
    return (
      <View style={styles.container}>
        <Text>
          {"\n"}
          {"\n"}
        </Text>
        <TextInput
          backgroundColor="skyblue"
          width={120}
          onChangeText={this.changeText}
          value={this.state.text}
        />
        <Button title="Add" onPress={this.onPressAddTodo} />
        <FlatList
          data={this.state.todos}
          renderItem={({ item }) => <Text>{item.title}</Text>}
          keyExtractor={(item, index) => index.toString()}
        // removeClippedSubviews={false}
        />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

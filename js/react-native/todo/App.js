import React from 'react';
import { StyleSheet, Text, View, SectionList, Button, TextInput, FlatList } from 'react-native';

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = { todos: [{ title: 'hoge' }, { title: 'hoge2' }] };
    this.onPressAddTodo = this.onPressAddTodo.bind(this);
  }

  // getInitialState() {
  //   console.log("getInitialState")
  //   return {
  //     todos: []
  //   }
  // }

  onPressAddTodo(e) {
    console.log("todos");

    const { todos } = this.state;
    todos.push({
      title: this.state.text
    });

    console.log(todos);

    this.setState({
      todos: todos //this.state.todos//Object.assign(this.state.todos, { title: this.state.title })
    });
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
          ref={(el) => { this.text = el; }}
          onChangeText={(text) => {
            this.setState({ text })
          }}
          value={this.state.text}
        //   ref
        // onChangeText={(text) => {
        //   console.log(text);
        //   this.setState({ text: text })
        //   console.log(this.state)
        // }}
        />
        <Button title="Add" onPress={this.onPressAddTodo} />
        <FlatList
          data={this.state.todos}
          execData={this.state.todos}
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

class Person {
    name: string;
    age: number;

    constructor() {
        this.age = 20;
        this.name = "hoge";
    }

    public echo(): string {
        return "hello " + this.name + "!!";
    }
}

class Employee extends Person {
    constructor() {
        super();
    }

    echo(): string {
        return "hello" + super.echo();
    }
}
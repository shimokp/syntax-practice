use serde::{ Serialize, Deserialize, de };

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct User {
    id: u64,
    name: Name
}

// #[derive(Deserialize)] もできるが、Name::newには制約をつけているため、どんな文字列でもNameに変換できてしまうのを防ぐ
#[derive(Clone, Debug, Serialize)]
pub struct Name(String);

impl<'de>de::Deserialize<'de> for Name {
    fn deserialize<D>(deserializer: D) -> Result<Self, D::Error>
    where
        D: de::Deserializer<'de>,
        {
            let s = String::deserialize(deserializer)?;
            Name::new(&s).map_err(de::Error::custom)
        }
}

impl Name {
    pub fn new(name: &str) -> Result<Self, String> {
        let size = name.chars().count();
        if size < 1 || size > 10 {
            return Err("名前は10文字以内で".to_string());
        }

        if name.chars().any(|c| !c.is_ascii_alphabetic()) {
            return Err("Use only A-Z, a-z".to_string());
        }

        Ok(Name(name.to_string()))
    }
}

impl std::str::FromStr for Name {
    type Err = String;

    fn from_str(s: &str) -> Result<Self, Self::Err> {
        Name::new(s)
    }
}

impl std::fmt::Display for Name {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.0)
    }
}
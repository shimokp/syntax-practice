use std::collections::HashMap;
use std::sync::Arc;

use tokio::sync::Mutex;
use crate::models::User;

type Database = Arc<Mutex<HashMap<u64, User>>>;

pub fn init_db() -> Database {
    Arc::new(Mutex::new(HashMap::new()))
}

use actix_web::{get, App, HttpServer, Responder};
use std::env;
use dotenv::dotenv;

#[get("/")]
async fn greet() -> impl Responder {
    
    dotenv().ok(); //loads the environment variables from the ".env" file.
    let env = env::var("PRINT_ENV").ok().unwrap();
    let endpoint = env::var("ENDPOINT").ok().unwrap();
    let port = env::var("PORT").ok().unwrap();
    let nongkai = env::var("NONGKAI").ok().unwrap();
    format!("PRINT_ENV: {env}\nENDPOINT: {endpoint}\nPORT: {port}\n\nSyntax: $PRINT_ENV, $ENDPOINT:$PORT\nOutput: {env}, URL: {endpoint}:{port}\n\nLoad from file .env:\n  NONGKAI: {nongkai}")
    
    // for (key, value) in env::vars() {
    //     format!("{}: {}", key, value);
    // }
}

#[actix_web::main] // or #[tokio::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new().service(greet)
    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}
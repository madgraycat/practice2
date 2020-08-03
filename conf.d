events {
  worker_connections 768;
  multi_accept on;

}
http {
  server {
    listen 80;

    location / {
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_pass http://app:5000;
    }
    location ~* .(html|jpg|jpeg|gif|png|ico|css|zip|rar|pdf)$ {
      root /home/deployer/app/static ;
      error_page 404 = 404;
    }
  }
}
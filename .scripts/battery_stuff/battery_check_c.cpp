#include <fcntl.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

#include <iostream>
#include <string>

#include <dbus-1.0/dbus/dbus.h>

#include "subprocess.hpp"

#define FIFO_PATH "battery_check_fifo"
#define BUF_SIZE 30

void gen_info(char buf[BUF_SIZE]) {
  subprocess::popen cmd("python", {"battery_check"});
  std::string percentage_str;
  std::getline(cmd.stdout(), percentage_str);
  float percentage = std::stof(percentage_str);
  
  std::string state_str;
  std::getline(cmd.stdout(), state_str);
  int state = std::stoi(state_str);

  std::sprintf(buf, "%d\n%d\n", (int)percentage, state);
}

int main() {
  int fifo_fd = open(FIFO_PATH, O_RDONLY | O_NONBLOCK);
  char buf[BUF_SIZE];
  int read_res = read(fifo_fd, buf, BUF_SIZE);
  std::cout << read_res << "\n";
  if (read_res == 0) {
    // there isnt anything in the fifo yet to be read, so this is the first time
    // this program has been called
    
    if (fork() == 0) {
      // print out battery information to output
      int fifo_fd_2 = open(FIFO_PATH, O_WRONLY | O_APPEND);
      auto fifo_f = fopen(FIFO_PATH, "w");
      char out_buf[BUF_SIZE];
      gen_info(out_buf);
      std::string output(out_buf, BUF_SIZE);

      std::cout << "writing\n";
      // std::cout << write(fifo_fd_2, out_buf, BUF_SIZE) << std::endl;
      fwrite(out_buf, BUF_SIZE, 1, fifo_f);
      // write(fileno(stdout), out_buf, BUF_SIZE);
      std::cout << "written\n";
      close(fifo_fd_2);
    }
  }
  else {
    std::cout << "theres some stuff in here\n";
    int pid = fork();
    if (pid > 0) {
      // use information read to send notification about battery status
    }
    else if (pid == 0) {
      // print out battery information to output
    }
    else {
      printf("Failed to create child process");
    }
  }

  close(fifo_fd);

  return 0;
}

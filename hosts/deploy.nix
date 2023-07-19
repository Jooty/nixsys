inputs: {
  nodes = with inputs.deploy-rs.lib.x86_64-linux; {
    makima = {
      hostname = "makima";
      profiles.system = {
        user = "root";
        path = activate.nixos inputs.self.nixosConfigurations.Makima;
      };
      sshUser = "jay";
      magicRollback = false;
    }
  }
}
{ inputs, ... }:

{
  imports = [ inputs.walker.homeManagerModules.walker ];

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      placeholder = "lookin\' cute today :3";
      fullscreen = true;

      activation_mode = {
        use_alt = true;
      };

      list = {
        height = 200;
      };

      align = {
        width = 400;
        horizontal = "center";
        vertical = "center";
      };

      modules = [
        {
          name = "applications";
          prefix = "";
        }
        {
          name = "runner";
          prefix = ".";
        }
      ];

    };

    style = builtins.readFile ./style.css;
  };
}

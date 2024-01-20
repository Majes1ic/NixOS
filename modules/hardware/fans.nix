{
    import = [
      ../upstream/fan2go.nix
    ];
    programs.fan2go = {
      enable = true;
      systemd.enable = true;
      settings = {

        fans = [ 
          {
            id = "cpu";
            hwmon = {
              platform = "it${chipID}-*";
              rpmChannel = 3;
            };
            neverStop = false;
            curve = "cpu_curve";
          }
        ];

        sensors = [
          {
            id = "cpu_temp";
            hwmon = {
              platform = "coretemp-isa-*";
              index = 1;
            };
          }
        ];

        curves = [
          {
            id = "cpu_curve";
            linear = {
              sensor = "cpu_temp";
              min = 40;
              max = 90;
              steps = [
                { "0" = 51; }
                { "40" = 51; }
                { "50" = 77; }
                { "58" = 102; }
                { "62" = 130; }
                { "65" = 165; }
                { "70" = 204; }
                { "90" = 255; }
              ];
            };
          };
        ];
      };
    };
}  
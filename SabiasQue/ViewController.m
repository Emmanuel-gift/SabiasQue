
#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UISegmentedControl *categorias;
@property (strong, nonatomic) UILabel *titulo;
@property (strong, nonatomic) UILabel *dato;
@property (strong, nonatomic) UIButton *boton;

@property (strong, nonatomic) NSArray *informacion;
@property (nonatomic) NSInteger indice;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:0.94
                                                green:0.96
                                                 blue:1.0
                                                alpha:1.0];

    self.indice = -1;

    self.informacion = @[
        @[
            @"La luz del Sol tarda aproximadamente 8 minutos en llegar a la Tierra.",
            @"Venus tarda mas en girar sobre si mismo que en orbitar el Sol.",
            @"Los rayos pueden alcanzar temperaturas de 30000 grados."
        ],
        @[
            @"Los pulpos tienen tres corazones.",
            @"Las jirafas tienen siete vertebras cervicales.",
            @"Las abejas se comunican mediante movimientos."
        ],
        @[
            @"El primer mensaje de ARPANET fue LO.",
            @"Los codigos QR almacenan informacion en dos dimensiones.",
            @"El GPS utiliza senales de varios satelites."
        ]
    ];

    UILabel *encabezado = [[UILabel alloc] init];
    encabezado.text = @"¿Sabías qué?";
    encabezado.font = [UIFont boldSystemFontOfSize:30];
    encabezado.textAlignment = NSTextAlignmentCenter;
    [self agregar:encabezado arriba:80 alto:50];

    self.titulo = [[UILabel alloc] init];
    self.titulo.text = @"¡Aprende algo nuevo cada día!";
    self.titulo.font = [UIFont systemFontOfSize:17];
    self.titulo.textAlignment = NSTextAlignmentCenter;
    [self agregar:self.titulo arriba:140 alto:40];

    self.categorias = [[UISegmentedControl alloc]
        initWithItems:@[@"Ciencia", @"Animales", @"Tecnología"]];

    self.categorias.selectedSegmentIndex = 0;

    [self.categorias addTarget:self
                        action:@selector(cambiarCategoria)
              forControlEvents:UIControlEventValueChanged];

    [self agregar:self.categorias arriba:210 alto:45];

    self.dato = [[UILabel alloc] init];
    self.dato.text = @"Selecciona una categoría y presiona el botón.";
    self.dato.numberOfLines = 0;
    self.dato.textAlignment = NSTextAlignmentCenter;
    self.dato.font = [UIFont systemFontOfSize:19];
    self.dato.backgroundColor = [UIColor whiteColor];
    self.dato.layer.cornerRadius = 15;
    self.dato.layer.masksToBounds = YES;

    [self agregar:self.dato arriba:290 alto:170];

    self.boton = [UIButton buttonWithType:UIButtonTypeSystem];

    [self.boton setTitle:@"¡Sorpréndeme!"
                 forState:UIControlStateNormal];

    self.boton.backgroundColor = [UIColor systemBlueColor];
    [self.boton setTitleColor:[UIColor whiteColor]
                     forState:UIControlStateNormal];

    self.boton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.boton.layer.cornerRadius = 12;

    [self.boton addTarget:self
                   action:@selector(mostrarDato)
         forControlEvents:UIControlEventTouchUpInside];

    [self agregar:self.boton arriba:500 alto:55];
}

- (void)agregar:(UIView *)elemento
          arriba:(CGFloat)posicion
            alto:(CGFloat)altura {

    elemento.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:elemento];

    [NSLayoutConstraint activateConstraints:@[
        [elemento.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor
                                               constant:25],
        [elemento.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor
                                                constant:-25],
        [elemento.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor
                                            constant:posicion],
        [elemento.heightAnchor constraintEqualToConstant:altura]
    ]];
}

- (void)cambiarCategoria {

    self.indice = -1;

    self.dato.text = @"Presiona el botón para descubrir un dato curioso.";

    [self.boton setTitle:@"¡Sorpréndeme!"
                forState:UIControlStateNormal];
}

- (void)mostrarDato {

    NSInteger categoria = self.categorias.selectedSegmentIndex;

    NSArray *datos = self.informacion[categoria];

    self.indice = (self.indice + 1) % [datos count];

    self.dato.text = datos[self.indice];

    [self.boton setTitle:@"Otro dato"
                forState:UIControlStateNormal];
}

@end

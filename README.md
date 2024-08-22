# Simple Quote Finance calculator

Este proyecto es una aplicación en Ruby que permite conectarse a una API, obtener información sobre una factura, procesar dicha información, y calcular los costos de financiamiento, el giro a recibir y los excedentes relacionados con la operación de la factura.

## Características

- **Conexión a la API**: Obtiene cotizaciones para una factura específica desde una API externa.
- **Cálculo de Financiación**: Calcula el costo de financiamiento, el giro a recibir y los excedentes basados en la cotización de la factura.

## Instalación

1. Clone este repositorio en tu máquina local:

```bash
git clone https://github.com/alvaroveliz/simple-quote-finance-calculator.git
```

2. Ingrese en el directorio del proyecto

```bash
cd simple-quote-finance-calculator
```

3. Instale las dependencias

```bash
bundle install
```

## Uso

1. Cree un archivo .env con el valor de tu `API_KEY` (puede copiar el archivo .env.example)
   
```ruby
API_KEY='tu_api_key'
```

2. Ejecuta el programa
   
```ruby
ruby main.rb
```

3. El programa calculará y mostrará los siguientes resultados:
 - Costo de financiamiento
 - Giro a recibir
 - Excedentes

## Pruebas

Este proyecto incluye pruebas unitarias que pueden ser ejecutadas con el siguiente comando:

```ruby
bundle exec rspec
```
Todas las pruebas se encuentran el directorio spec

## Sobre mi

Mi nombre es Álvaro Véliz y soy Ingeniero de Software Senior.

- 
- 📫 Si desea contactarme visite mi [perfil de LinkedIn](https://www.linkedin.com/in/alvaroveliz/)

Estos son mis stats en Github:

![My Github Stats](https://github-readme-stats.vercel.app/api?username=alvaroveliz&show_icons=true&theme=transparent)


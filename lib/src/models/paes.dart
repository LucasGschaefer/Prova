class Filme {
  late int id;
  late String receitas;
  late double paesTRadicionais;
  late String paesRecheados;
  late String paesEnriquecidos;
  late String paesForma;

  Filme(
    this.id,
    this.receitas,
    this.paesTRadicionais,
    this.paesRecheados,
    this.paesEnriquecidos,
    this.paesForma,
  );

  Filme.fromJson(Map<String, dynamic> json) {
    
    this.id = json['id'];
    
    this.receitas = json['title'];
    
    this.paesTRadicionais = json['vote_average'] * 1.0;

    this.paesRecheados = json['release_date'];
    
    this.paesEnriquecidos = json['overview'];
    paesForma = json['poster_path']; null;
  }
}

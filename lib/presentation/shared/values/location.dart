import 'package:cv_desing_website_flutter/domain/category.dart';
import 'package:cv_desing_website_flutter/presentation/shared/components/category_extensions.dart';

class Location {
  static const appTitle = 'Diseños CV';
  static const home = 'Inicio';
  static const desings = 'Diseños';
  static const cvEditor = 'Diseña tu CV';
  static const blog = 'Blogs';
  static const auth = 'Autenticación';

  static const portfolioSectionTitle = 'Diseños';
  static const portfolioSectionSubtitle = 'Escoge tu preferido';

  static const curriculum = 'Curriculum';
  static const curriculums = 'Curriculums';
  static const flyer = 'Flyer';
  static const flyers = 'Flyers';
  static const businessCard = 'Tarjeta visita';
  static const businessCards = 'Tarjeta visita';
  static const rightsReserved = 'All rights reserved';
  static const designedBy = 'Designed by';
  static const dsCurriculum = 'Diseños Currículum Vitae';
  static const builtBy = 'Built with Flutter by';
  static const amdiaz = 'amdiaz';
  static const madeIn = 'Made in';
  static const withLove = 'with';
  static const resourceNotFound = 'No se ha encontrado el recurso que buscaba';
  static const goBack = 'Volver';
  static const close = 'Cerrar';
  static const requestDesing = 'Solicitar';
  static const share = 'Compartir';
  static const homeTitle = 'Realizamos tu Currículum';
  static const homeSubtitle1 = 'Impulsa el potencial de tu CV y destácate';
  static const homeSubtitle2 = 'Gran cantidad de diseños';
  static const homeSubtitle3 = 'Obten tu CV actualizado en poco tiempo';
  static const start = 'Empezar';
  static const email = 'Email';
  static const password = 'Contraseña';

  static const signIn = 'Acceder';
  static const signUp = 'Registrarse';
  static const signOut = 'Salir';
  static const signInWithGoogle = 'Acreditarse con la cuenta de Google';

  static const invalidPassword = 'Contraseña erronea';
  static const invalidEmail = 'Email erroneo';

  static const showMenu = 'Mostrar menu';

  static String shareMessage(Category category, String url) =>
      '${category == Category.businessCard ? 'Esta' : 'Este'} ${category.displayName} te puede venir bien $url';

  static String shareSubject(Category category) =>
      'Te puede interesar ${category == Category.businessCard ? 'esta' : 'este'} ${category.displayName}';

  static const personalInformation = 'Información personal';
  static const conactInformation = 'Información de contacto';
  static const academicTraining = 'Formación académica';
  static const complementaryFormations = 'Formaciones complementarias';
  static const workExperience = 'Experiencia laboral';
  static const languages = 'Idiomas';
  static const softwareSkills = 'Software y Tecnologías';
  static const skillsandAptitudes = 'Competencias y habilidades';
  static const aboutMe = 'Sobre mí';
  static const address = 'Dirección';
  static const phone = 'Teléfono';
}

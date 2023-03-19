DATA_SECTION
// Reading module.
  int debug_input_flag
  !! debug_input_flag=1;
  !! ofstream ofs("input.log");
  init_int firstyear    // firstyear used in the assesment
  init_int lastyear;	// Last year used in the assessment
  init_int firstdatayear // First year with catch data
  init_int lastdatayear // First year with catch data
  !!
  init_int firstage 	// First age
  init_int nsimuyrs	// Number of years simulated
  init_int nages	// Number of age groups
  init_int firstcatchage	// First age group in catch
  init_int PlusGroup;  // Is last age group + group 1 not 0
  int a1  // firstcatchage-firstage+1
  !!a1 = firstcatchage-firstage+1;
  int nyrs;
  !!nyrs = lastyear - firstyear + 1;
  int ndatayrs;
  !!ndatayrs = lastdatayear - firstdatayear + 1;
  !! ofs << " lastyear " << lastyear << " firstyear " << firstyear;
  !! ofs << " firstdatayear " << firstdatayear << " lastdatayear " << lastdatayear ;
  !! ofs  << " firstage " << firstage << endl ;
  !! ofs << " ndatayrs " << ndatayrs << " nsimuyrs " << nsimuyrs << " nages " << nages ;
  !! ofs << " firstcatchage " << firstcatchage << "a1 " << a1;
  !! ofs << "PlusGroup " << PlusGroup << endl;

  init_matrix ObsCatchInNumbersData(1,ndatayrs,a1,nages) // catch in numbers
  !! ofs << "ObsCatchInNumbersData " << endl << ObsCatchInNumbersData << endl;

// Weights in catch  The value for ndatayrs+2 is used in simulations
  init_matrix CatchWtsData(1,ndatayrs+4,a1,nages)
  !! ofs << "CatchWtsData "<< endl  << CatchWtsData << endl;

// Weights in spawning stock. The value for ndatayrs+2 is used in simulations
  init_matrix ssbWtsData(1,ndatayrs+4,a1,nages)
  !! ofs << "ssbWtsData " << ssbWtsData << endl;

// Maturity at age.   The value for ndatayrs+2 is used in simulations
  init_matrix StockSexMatData(1,ndatayrs+4,a1,nages)
  !! ofs << "StockSexMatData " << StockSexMatData << endl;

//  Weights in stock. The value for ndatayrs+2 is used in simulations
// Have to be listed for all age groups, not only those in the catch.

  init_matrix StockWtsData(1,ndatayrs+4,1,nages);
  !! ofs << "StockWtsData" << endl << StockWtsData << endl;

  init_matrix ProgSelection(ndatayrs+1,ndatayrs+4,a1,nages);
  !! ofs << "ProgSelection" << endl << ProgSelection << endl;


// Natural mortality by age:
  init_vector M1(1,nages)
  !! ofs << "M" << endl << M1 << endl;
// Mean selection used for catchable biomass
  init_vector MeanSel(a1,nages);
  !! ofs << "MeanSel" << endl << MeanSel << endl;

// Survey data.  (Assumed to be at the beginning of the year)
//**********************************************************
  init_int surveyfirstyear  // number of first year
  init_int surveylastyear    // number of last year (can be one more than years where catchdata are available)
  init_int surveyfirstage  // Number of first age group in survey.
  init_int surveylastage
  !! ofs << "surveyfirstyear "  << surveyfirstyear << "surveylastyear " << surveylastyear;
  !! ofs << "surveyfirstage " << surveyfirstage << "surveylastage " << surveylastage << endl;
  int surveyfirstyearnr;
  int surveylastyearnr;
  int surveyfirstagenr
  int surveylastagenr;
  !!surveyfirstyearnr = surveyfirstyear-firstyear+1;
  !!surveylastyearnr = surveylastyear-firstyear+1;
  !!surveyfirstagenr = surveyfirstage-firstage+1;
  !!surveylastagenr = surveylastage-firstage+1;

  init_matrix ObsSurveyNr(surveyfirstyearnr,surveylastyearnr,surveyfirstagenr,surveylastagenr)  // surveyindices
  !! ofs << "ObsSurveyNr " << ObsSurveyNr << endl;

  init_number SurveyPropOfF; // Proportion of F before survey
  init_number SurveyPropOfM; // Proportion of M before survey
  !! ofs << "SurveyPropOfF " <<  SurveyPropOfF << "SurveyPropOfM " << SurveyPropOfM << endl ;
  init_int FirstageWithConstantCatchability; // First age with linear relationship
  init_int FirstageWithFullcatchability;  // Flat selection above this
  init_int SurveyNRelationship;   //Relationship for younger fish.   Powercurve 1; Intercept 2
  !! ofs << "FirstageWithConstantCatchability " << FirstageWithConstantCatchability;
  !! ofs << " FirstageWithFullcatchability " << FirstageWithFullcatchability;
  !! ofs << " SurveyNRelationship " << SurveyNRelationship << endl ;

  init_vector SigmaCRatios(a1,nages); // Ratios of Sigmaa50, lnSigmaa50, Sigmaeffort to Csigma
  init_number sigmatotalcatch;  // cv when total catch is fitted to data.
  !! ofs << "sigmatotalcatch " << sigmatotalcatch << endl ;
// log(a+x)
  init_vector SigmaSurvey(surveyfirstagenr,surveylastagenr); // read in this version
  !! ofs << "SigmaSurvey " << endl << SigmaSurvey << endl;
  init_vector Surveyepsilon(surveyfirstagenr,surveylastagenr);
  !! ofs << "Surveyepsilon " << endl << Surveyepsilon << endl;

// ******************************************
//Survey2
  init_int surveyfirstyear2  // number of first year
  init_int surveylastyear2    // number of last year (can be one more than years where catchdata are available)
  init_int surveyfirstage2  // Number of first age group in survey.
  init_int surveylastage2
  !! ofs << "surveyfirstyear2 "  << surveyfirstyear2 << "surveylastyear2 " << surveylastyear2;
  !! ofs << "surveyfirstage2 " << surveyfirstage2 << "surveylastage2 " << surveylastage2 << endl;
  int surveyfirstyearnr2;
  int surveylastyearnr2;
  int surveyfirstagenr2
  int surveylastagenr2;
  !!surveyfirstyearnr2 = surveyfirstyear2-firstyear+1;
  !!surveylastyearnr2 = surveylastyear2-firstyear+1;
  !!surveyfirstagenr2 = surveyfirstage2-firstage+1;
  !!surveylastagenr2 = surveylastage2-firstage+1;

  init_matrix ObsSurveyNr2(surveyfirstyearnr2,surveylastyearnr2,surveyfirstagenr2,surveylastagenr2)  // surveyindices
  !! ofs << "ObsSurveyNr2 " << ObsSurveyNr2 << endl;

  init_number SurveyPropOfF2; // Proportion of F before survey
  init_number SurveyPropOfM2; // Proportion of M before survey
  !! ofs << "SurveyPropOfF2 " <<  SurveyPropOfF2 << "SurveyPropOfM2 " << SurveyPropOfM2 << endl ;
  init_int FirstageWithConstantCatchability2; // First age with linear relationship
  init_int FirstageWithFullcatchability2;  // Flat selection above this
  init_int SurveyNRelationship2;   //Relationship for younger fish.   Powercurve 1; Intercept 2
  !! ofs << "FirstageWithConstantCatchability2 " << FirstageWithConstantCatchability2;
  !! ofs << " FirstageWithFullcatchability2 " << FirstageWithFullcatchability2;
  !! ofs << " SurveyNRelationship2 " << SurveyNRelationship2 << endl ;

// log(a+x)
  init_vector SigmaSurvey2(surveyfirstagenr2,surveylastagenr2); // read in this version
  !! ofs << "SigmaSurvey2 " << endl << SigmaSurvey2 << endl;
  init_vector Surveyepsilon2(surveyfirstagenr2,surveylastagenr2);
  !! ofs << "Surveyepsilon2 " << endl << Surveyepsilon2 << endl;

// ******************************************



  init_vector Catchepsilon(a1,nages);
  !! ofs << "Catchepsilon " << endl << Catchepsilon << endl;

// Numbers relating to SSB-Recruitment.
  init_int SSBRectype	// if 1 Beverton and Holt, 2  Ricker. 3 Shannon
  init_number SpawnCv; // CV in spawning stock recruitment relationship ? estimate
  init_number Spawncorr;  // Autocorrelation in stock recruitment relationship
  init_number Spawnpow; // How Cv in recruitment depends on spawning stock.
  init_number PropofFbeforeSpawning; //= 0.7; // Read later from file
  init_number PropofMbeforeSpawning; //= 0.25; // Read later from file age
  init_int minssbage;

  !!ofs	<< "SSBRectype " << SSBRectype << " SpawnCv " << SpawnCv ;
  !!ofs << " Spawncorr " << Spawncorr << " Spawnpow " << Spawnpow << endl ;
  !!ofs << " PropofFbeforeSpawning " <<  PropofFbeforeSpawning <<  " PropofMbeforeSpawning " <<  PropofMbeforeSpawning ;
  !!ofs << "minssbage " <<  minssbage ;

// Migrations.


  init_int MigrationNumbers;
  !! ofs << "MigrationNumbers " << MigrationNumbers << endl ;
  init_vector MigrationYears(1,MigrationNumbers);
  !! ofs << "MigrationYears " << MigrationYears << endl ;
  init_vector MigrationAges(1,MigrationNumbers);
  !! ofs << "MigrationAges " << MigrationAges << endl ;

  init_vector Likeliweights(1,10); // Weights on likelhood comp, usually 1
  !! ofs << "Likeliweights " << Likeliweights << endl ;
// Harvesting rules

  init_number CatchRule; // Number of catch rule.
  init_number CvAssessment;	// Cv in assessment (at medium stocksize)
  init_number Assessmentcorr;  // Autocorrelation in assessment
  init_number Assessmentpow; // How CV in assessment depends on stocksize
  init_number AssessmentBias;
  init_number HarvestProportion; //Proportion taken in harvest rule
  init_number FutureF;  // If F is specified
  init_number QuotaLeft;
  init_number NextYearsTac; // if == 0 calculated.

  !!ofs << "Catchrule " << CatchRule << " CvAssessment " << CvAssessment << " Assessmentcorr " ;
  !!ofs	<< Assessmentcorr << " Assessmentpow " << Assessmentpow ;
  !!ofs << "AssessmentBias" << AssessmentBias << endl;
  !!ofs << "HarvestProportion " << HarvestProportion << endl;
  !!ofs << "FutureF " << FutureF << endl;

  init_vector FutureCatch(nyrs+1,nyrs+nsimuyrs); // Catch for the next years needed for some catchrules;
  !! ofs << "FutureCatch" << FutureCatch << endl;
// Retro does not function if skipyears is > 0 ???
  int retroyears
  !! retroyears = lastdatayear - lastyear; // RETRO true.
  !! ofs << "retroyears " << retroyears << endl;


PARAMETER_SECTION

// Natural mortality parameters

  vector sdM(1,nyrs+nsimuyrs);
  number dnM;
  number Mdrift

// Weights  (Copy of data)
  matrix CatchWts(1,nyrs+nsimuyrs,a1,nages)
  matrix ssbWts(1,nyrs+nsimuyrs,a1,nages)
  matrix SexMat(1,nyrs+nsimuyrs,a1,nages)
  matrix StockSexMat(1,nyrs+nsimuyrs,a1,nages)
  matrix StockWts(1,nyrs+nsimuyrs,1,nages)
  matrix ObsCatchInNumbers(1,nyrs,a1,nages);

// Migrations Read  from file estimate ratios
  init_bounded_vector logMigrationRatios(1,MigrationNumbers,-9,0,5);

// *****************------------------********************************
// parameters in stock-recr relationship.  The parameter SSBmax
// is in reality 5*SSB50 in Beverton and Holt.

  init_bounded_number logRmax(10,14.1,3); // 200 - 700 million 1 year old
  init_bounded_number logSSBmax(3.5,7.5,3);  //   ca. 100 - 1800 thousand tonnes.
  init_bounded_number SpawnCvest(0.001,0.8,3);
  init_bounded_number Spawnpowest(0,.9,3);  //thg in recruitment variance
  init_bounded_number Spawncorrest(0,0.8,3);  //thg in recruitment variance
//  init_bounded_number dSha(0,2,3);  //thg distributing 1 ageclass to k gives maximum k**0.9 gain
  number dSha;  // has to be estimated in alternative 3.
//  init_bounded_number fecunditymultiplier(1,8,5); // Proportion of eggs as function of weights.
  number fecunditymultiplier;

  vector N_1(1,nyrs+nsimuyrs-firstage); // Number of age 1
  vector predN_1(1,nyrs+nsimuyrs-firstage)  // Predicted number age 1.
  vector resid_1(1,nyrs+nsimuyrs-firstage) // residuals

// **********************************************
  init_bounded_vector logRefF(nyrs+1,nyrs+nsimuyrs,-5,1,2);
  matrix F(1,nyrs+nsimuyrs,1,nages)
  matrix natM(1,nyrs+nsimuyrs,1,nages);   // Natural mortality
  matrix Z(1,nyrs+nsimuyrs,1,nages);  // Total mortality
  matrix Spc(1,nyrs+nsimuyrs,1,nages);  // Survival percent
  matrix PropInCatch(1,nyrs+nsimuyrs,a1,nages); // Modelled proportion in catch
  vector TotalCalcCatchInNumbers(1,nyrs+nsimuyrs); // modeled catch in numbers by year
  number firsttime; // for printing
  matrix CalcCatchInNumbers(1,nyrs+nsimuyrs,a1,nages); // modelled catch in no by year and age
  vector meansel(a1,nages); // mean selection
  vector progsel(a1,nages); // selection in prognosis (last ?? years)



// Initial or final population
  init_bounded_vector logsurvivors(1,nages-1,0.1,13.8);  // log of initial population
  init_bounded_vector log_recr(nyrs+2,nyrs+nsimuyrs,1,14) ;// log of recruitment from age 1.
  matrix N(1,nyrs+nsimuyrs,1,nages);  // Number in stock
  matrix MigrationRatios(1,nyrs+nsimuyrs,1,nages);  // Proportion that migrated





// Survey data Maybe put CalcSurveyNr and CalcSurveybio as sdreport

  vector SigmaSurvey(surveyfirstagenr,surveylastagenr)
  init_bounded_vector logSigmaSurvey(surveyfirstagenr,surveylastagenr-2,-6,2,4)

  init_bounded_vector SurveylnQest(surveyfirstagenr,FirstageWithFullcatchability-firstage+1,-40,0,5);  // catchability in survey.
//  init_bounded_dev_vector SurveylnYeareffect(surveyfirstyearnr,surveylastyearnr,-2,2,4);
  vector SurveylnYeareffect(surveyfirstyearnr,surveylastyearnr);

  vector SurveyPowerest(surveyfirstagenr,FirstageWithConstantCatchability-firstage);   // Power curve for first age groups.
  vector SurveylnQ(surveyfirstagenr,surveylastagenr);
  vector SurveyPower(surveyfirstagenr,surveylastagenr);
  vector surveyintercept(surveyfirstagenr,surveylastagenr);
  matrix CalcSurveyNr(1,nyrs+nsimuyrs,surveyfirstagenr,surveylastagenr);  // estimated surveyindices
  matrix RSsurveydiff(surveyfirstyearnr,surveylastyearnr,surveyfirstagenr,surveylastagenr);  // Residuals from survey fit
  vector CalcSurveybio(1,nyrs+nsimuyrs);
  vector ObsSurveybio(surveyfirstyearnr,surveylastyearnr);
  number pZ;  // Z before survey.

// ********************* survey 2************************
// Survey data Maybe put CalcSurveyNr and CalcSurveybio as sdreport

  vector SigmaSurvey2(surveyfirstagenr2,surveylastagenr2);
  init_bounded_vector logSigmaSurvey2(surveyfirstagenr2,surveylastagenr2-2,-6,2,4);

  init_bounded_vector SurveylnQest2(surveyfirstagenr2,FirstageWithFullcatchability2-firstage+1,-40,0,5);  // catchability in survey.
//  init_bounded_dev_vector SurveylnYeareffect(surveyfirstyearnr,surveylastyearnr,-2,2,4);
  vector SurveylnYeareffect2(surveyfirstyearnr2,surveylastyearnr2);

  vector SurveyPowerest2(surveyfirstagenr2,FirstageWithConstantCatchability2-firstage);   // Power curve for first age groups.
  vector SurveylnQ2(surveyfirstagenr2,surveylastagenr2);
  vector SurveyPower2(surveyfirstagenr2,surveylastagenr2);
  vector surveyintercept2(surveyfirstagenr2,surveylastagenr2);
  matrix CalcSurveyNr2(1,nyrs+nsimuyrs,surveyfirstagenr2,surveylastagenr2);  // estimated surveyindices
  matrix RSsurveydiff2(surveyfirstyearnr2,surveylastyearnr2,surveyfirstagenr2,surveylastagenr2);  // Residuals from survey fit
  vector CalcSurveybio2(1,nyrs+nsimuyrs);
  vector ObsSurveybio2(surveyfirstyearnr2,surveylastyearnr2);
  number pZ2;  // Z before survey.


  number HCRreflebreak;

// Biomass data that are stored as sdreport


  matrix predicted_N(nyrs+1,nyrs+nsimuyrs,1,nages)
  vector Spawningstock(1,nyrs+nsimuyrs)
// Spawning stock based on survey weights and maturity.
  vector CbioR(1,nyrs+nsimuyrs)  // Real cbio
  vector HCRRefbio(1,nyrs+nsimuyrs)  // Refbio y+1 is based on y data
  sdreport_vector PredHCRRefbio(nyrs-3,nyrs+nsimuyrs)  //
  vector Cbio1(1,nyrs+nsimuyrs)  // catch wts
  vector Cbio2(1,nyrs+nsimuyrs)  // stock weights
  sdreport_vector RelCbioR(nyrs-3,nyrs+nsimuyrs)
  sdreport_vector RelCbio1(nyrs-3,nyrs+nsimuyrs)
  sdreport_vector RelCbio2(nyrs-3,nyrs+nsimuyrs)
  sdreport_vector RelSpawningstock(nyrs-3,nyrs+nsimuyrs)
  sdreport_vector PredCbioR(nyrs-3,nyrs+nsimuyrs)  // Real cbio
  sdreport_vector PredCbio1(nyrs-3,nyrs+nsimuyrs)  // catch wts
  sdreport_vector PredCbio2(nyrs-3,nyrs+nsimuyrs)  // stock weights
  sdreport_vector PredSpawningstock(nyrs-3,nyrs+nsimuyrs);

  vector RefF(1,nyrs+nsimuyrs);
  sdreport_vector PredRefF(nyrs-3,nyrs+nsimuyrs);
  vector HarvestRatio(1,nyrs+nsimuyrs);
  sdreport_vector PredHarvestRatio(nyrs-3,nyrs+nsimuyrs);
  vector CalcCatchIn1000tons(1,nyrs+nsimuyrs);
  sdreport_vector PredCatchIn1000tons(nyrs+1,nyrs+nsimuyrs);
  vector FishingYearCatch(1,nyrs+nsimuyrs);

//  vector FishingYearCatch(nyrs+1,nyrs+nsimuyrs);
  vector CatchIn1000tons(1,nyrs); // From data.
  vector CatchIn1000tonsforRetro(1,nyrs+retroyears); // From data.
  vector Shannon(1,nyrs+nsimuyrs-firstage); // Shannon index
  vector N3(1,nyrs+nsimuyrs);
  vector N1(1,nyrs+nsimuyrs);
  sdreport_vector PredN2(nyrs-3,nyrs+nsimuyrs);
  sdreport_vector PredN3(nyrs-3,nyrs+nsimuyrs);
  sdreport_vector CurrentN(1,nages);
  sdreport_vector NextYearsN(1,nages);


// Catchrule and related things.
    vector Assessmenterr(1,nsimuyrs);
  //init_bounded_vector Assessmenterr(1,nsimuyrs,-5,5);
  //init_bounded_vector Weighterr(1,nsimuyrs,-5,5);

   vector Weighterr(1,nsimuyrs);


  vector LnLikelicomp(1,10);  // likelihood function
  objective_function_value LnLikely

  number printcounter;
  matrix Scorrmat(1,surveylastagenr-surveyfirstagenr+1,1,surveylastagenr-surveyfirstagenr+1);
   number SurveylnDet;
  matrix Scorrmat2(1,surveylastagenr2-surveyfirstagenr2+1,1,surveylastagenr2-surveyfirstagenr2+1);
   number SurveylnDet2;
  vector RecrDrift(1,1);
// Parameters that are sometimes estimated

  init_bounded_number Surveycorr(0,0.8,4);
  init_bounded_number Surveycorr2(0,0.8,4);




TOP_OF_MAIN_SECTION
  gradient_structure::set_MAX_NVAR_OFFSET(1500);
  gradient_structure::set_NUM_DEPENDENT_VARIABLES(1500);
PRELIMINARY_CALCS_SECTION
  SurveylnYeareffect = 0;
   SurveylnYeareffect2 = 0;

  logMigrationRatios = 0;
  MigrationRatios = 1;
  RecrDrift = 0.0;
// Parameters that are sometimes estimated.
  Surveycorr = 0.2;
  Surveycorr2 = 0.2;
  logSigmaSurvey = 0;
  logSigmaSurvey2 = 0;


  ofstream outfile;
  outfile.open("result");
  outfile << "year ssb effort N1 N3 Cbio Cbio4plus CalcCatch RefF" << endl;
  outfile.close();
// Nat M parameters
  dnM = 0.2;
  Mdrift = 0;
//  logSigmaM = log(0.1);

  HCRreflebreak = 44.5;
// initial values of SSB-recr param
  fecunditymultiplier = 4.3;
  Spawnpowest = Spawnpow;
  Spawncorrest = Spawncorr;
  logRmax = 12.6;  // u.þ.b 300 million 1 years
  logSSBmax = 6.2; // u.þ.b 500 þ.
  SpawnCvest = SpawnCv;
  Assessmenterr = 0;  // initial value of estimated variable.
  Weighterr = 0;

  logsurvivors = 11;  // 60 million
  log_recr = 12.3;  //200 million
  logRefF = log(0.5);

 // Survey parameters
  SurveyPowerest = 1;
  SurveyPowerest2 = 1;
//  logSigmaYearEffect = log(0.1);


// copying weights to matrices available for all years.
// This setup is to increase flexibility in simulations.
 int i = 0;
 int j = 0;
 int skipyears = firstyear-firstdatayear;

 for(i = 1 ; i <= nyrs; i++)
   ObsCatchInNumbers(i) = ObsCatchInNumbersData(i+skipyears);

 for(i = 1 ; i <= min(ndatayrs+3-skipyears,min(ndatayrs+3-skipyears,nyrs+nsimuyrs)); i++) {
   CatchWts(i) = CatchWtsData(i+skipyears);
   ssbWts(i) = ssbWtsData(i+skipyears);
   StockSexMat(i) = StockSexMatData(i+skipyears);
   StockWts(i) = StockWtsData(i+skipyears);
 }
 if(nyrs+nsimuyrs > ndatayrs+3-skipyears) {
    for(i = ndatayrs+4-skipyears ; i <= nyrs+nsimuyrs; i++) {
      ssbWts(i) = ssbWtsData(ndatayrs+4);
      StockSexMat(i) = StockSexMatData(ndatayrs+4);
      CatchWts(i) = CatchWtsData(ndatayrs+4);
      StockWts(i) = StockWtsData(ndatayrs+4);
    }
 }


// Calculate the catch in 1000 tonnes.
   for(i = 1; i <= nyrs; i++)
     CatchIn1000tons(i) = sum(elem_prod(CatchWts(i),ObsCatchInNumbers(i)))/1.0e6;
// Used for simulation in retros.
   for(i = 1; i <= min(nyrs+retroyears,ndatayrs-skipyears); i++)
     if(i <= nyrs+nsimuyrs)  // min does not work on 3.
       CatchIn1000tonsforRetro(i) = sum(elem_prod(CatchWts(i),ObsCatchInNumbersData(i+skipyears)))/1e6;


// Parameters in curve describing how stdev in catch in numbers and
// survey changes with age.



  SigmaSurvey = 0.5;
  SigmaSurvey2 = 0.5;
  firsttime = 0;
  printcounter = 1;

// Biomass from survey
  ObsSurveybio= -1;  // -1 is to identify NA in output files.
  CalcSurveybio = -1;
  ObsSurveybio2 = -1;
  CalcSurveybio2 = -1;
  for(i =  surveyfirstyearnr ; i<= surveylastyearnr ; i++)
     ObsSurveybio(i) = sum(elem_prod(ObsSurveyNr(i),StockWts(min(i,nyrs+nsimuyrs))(surveyfirstagenr,surveylastagenr)))/1000;
  for(i =  surveyfirstyearnr2 ; i<= surveylastyearnr2 ; i++)
     ObsSurveybio2(i) = sum(elem_prod(ObsSurveyNr2(i),StockWts(min(i,nyrs+nsimuyrs))(surveyfirstagenr2,surveylastagenr2)))/1000;

PROCEDURE_SECTION
 update_weights(); // not working in retros
//  cout << "getn"<<flush;
  get_historical_numbers_at_age();
//  cout << "getm"<<flush;
  get_mortality_and_survivial_rates();
// cout << "get_futureN" << flush;
  get_future_numbers_at_age();
//  cout << "getc"<< flush;
  get_catch_at_age();
//  cout << "eval" <<flush;
  evaluate_the_objective_function();

// Function to calculate number in stock by Popes cohort analysis.
// Not possible to have plus group.
FUNCTION get_historical_numbers_at_age
  calcNaturalMortality3(); // estimate natural mortality
  dvariable Noldest=10;
  N = 0;
  dvariable Nold;
  dvariable Nnew;
  dvariable Ntmp;
  dvariable Cnotmp;

  int i = 0; int j = 0;
  for(j = 1; j <= nages-1; j++)
     N(nyrs+1,j) += mfexp(logsurvivors(j));
  N(nyrs+1,nages) = Noldest;

// migrations they can make negative numbers.
  for(i = 1; i <= MigrationNumbers ; i++)
    if(int(MigrationYears(i)) >= firstyear-1  & int(MigrationYears(i)) <= lastyear+nsimuyrs-1)
	MigrationRatios(int(MigrationYears(i)-firstyear),int(MigrationAges(i)-firstage)) = mfexp(logMigrationRatios(i));
  for(i = nyrs; i >= 1; i--) {
    if(i > 4) N(i,nages) = Noldest + exp(-1)*ObsCatchInNumbers(i-1,nages-1)+exp(-2)*ObsCatchInNumbers(i-2,nages-2)+exp(-3)*ObsCatchInNumbers(i-3,nages-3)+exp(-4)*ObsCatchInNumbers(i-4,nages-4);
    if(i == 4) N(i,nages) = Noldest + exp(-1)*ObsCatchInNumbers(i-1,nages-1)+exp(-2)*ObsCatchInNumbers(i-2,nages-2)+exp(-3)*ObsCatchInNumbers(i-3,nages-3);
    if(i == 3) N(i,nages) = Noldest + exp(-1)*ObsCatchInNumbers(i-1,nages-1)+exp(-2)*ObsCatchInNumbers(i-2,nages-2);
    if(i == 2) N(i,nages) = Noldest + exp(-1)*ObsCatchInNumbers(i-1,nages-1);
    if(i == 1) N(i,nages)=Noldest;
    for(j = a1; j <= nages-1; j++)
      N(i,j) =  (N(i+1,j+1)*exp(natM(i,j)/2)+ObsCatchInNumbers(i,j))*exp(natM(i,j)/2)*MigrationRatios(i,j);
    for(j = 1; j < a1; j++)
      N(i,j) = N(i+1,j+1)*exp(natM(i,j));
    F(i,nages) = ObsCatchInNumbers(i,nages)/N(i,nages);  // Not correct but enough
    Z(i,nages) = F(i,nages) +natM(i,nages);

  }




// *******************-----------------***************
// Function to calculate fishing, natural and total mortality.
// Mean selection pattern and selection pattern for the last
// 3 years are calculated.

FUNCTION get_mortality_and_survivial_rates
  int refage1 = 4;  //F 4 to
  int refage2 = 7; // 7 for haddock.
  int i = 0;
  int j = 0;
  int age = 0;

  for(i = 1 ;i <= nyrs ; i++){
    for(j = a1; j <=nages-1; j++){
      Z(i,j) = -log(N(i+1,j+1)/N(i,j)*MigrationRatios(i,j));
      F(i,j) = Z(i,j) - natM(i,j) ; // Total mortality.  M only depends on age.
    }
     for(j = 1; j < a1; j++)
        Z(i,j) = natM(i,j) ; // No fishery on youngest.
  }
  // Calculate reference fishing mortality for example F4-7;
  // Then refage1 = 4 and refage2 = 7;

  for(i = 1; i <= nyrs; i++) {
    RefF(i) = 0;
    for(j = refage1-firstage+1 ; j <= refage2-firstage+1 ; j++)
      RefF(i) += F(i,j);
  }
  RefF /= refage2-refage1+1;



  for(j = a1; j <= nages; j++) {
    meansel(j) = 0;
    progsel(j) = 0;
    for(i = 1; i <= nyrs; i++)
      meansel(j)  += F(i,j)/RefF(i);
    for(i = nyrs-4; i <= nyrs; i++)
      progsel(j)  += F(i,j)/RefF(i);
  }
  meansel /= nyrs;
  progsel /= 5.0;

// Use prog selection of all the time period for prognosis.
  for(i = nyrs+1 ;i <= nyrs+nsimuyrs ; i++)
  {
    for(j = a1; j <=nages; j++){
       F(i,j) = mfexp(logRefF(i))*ProgSelection(min(i,ndatayrs+4),j);
       Z(i,j) = F(i,j) + natM(i,j) ; // Total mortality.  M only depends on age.
    }
    for(j = 1; j < a1; j++)
	Z(i,j) = natM(i,j);  // No fishing mortality of youngest.
  }
// Recalculate for the simulationyears.
  for(i = nyrs+1; i <= nyrs+nsimuyrs; i++) {
    RefF(i) = 0;
    for(j = refage1-firstage+1 ; j <= refage2-firstage+1 ; j++)
      RefF(i) += F(i,j);
    RefF(i) /= refage2-refage1+1;
  }
  PredRefF = RefF(nyrs-3,nyrs+nsimuyrs);

  // get the survival rate
  Spc=mfexp(-1.0*Z);

// Natural mortality fixed

FUNCTION calcNaturalMortality3
   int i;
   int j;
   dvariable age;
   for(i = 1; i <= surveyfirstyearnr-2; i++){
      for(j = 1; j <= nages; j++)
	natM(i,j) = dnM;
   }
   for(i = surveyfirstyearnr-1;i <= nyrs+nsimuyrs; i++){
      for(j = 1; j <= nages; j++)
	natM(i,j) = dnM;
   }
   for(i = 1; i <= nyrs+nsimuyrs; i++)
     sdM(i) = natM(i,6);


// Calculate numbers from initial numbers, recruitment and
// total mortality.

FUNCTION get_future_numbers_at_age
  int i = 0;
  int j = 0;
  for( i = nyrs+2; i <= nyrs+nsimuyrs; i++)
    N(i,1) = mfexp(log_recr(i));
  for (i=nyrs+1;i<nyrs+nsimuyrs;i++){
    for (j=1;j<nages;j++)
      N(i+1,j+1) = N(i,j)*Spc(i,j);
  }

  // Could be replaced by submatrix operators
  for(i = nyrs+2; i <=nyrs+nsimuyrs;i++)
    predicted_N(i) = N(i);  // predicted_N is sdreport matrix
  CurrentN = N(nyrs);
  NextYearsN = N(nyrs+1);
  for(i = 1; i <= nyrs+nsimuyrs; i++){
    N3(i) = N(i,3);
    N1(i) = N(i,1);
  }

// Various versions of catchable biomass.  CbioR is based on selectionpattern
// Cbio2 on all fishes older than 3 and catch weights and Cbio1 on all fishes
// older than 3 and survey Weights.
// put certain percent of Z before spawning when calculating Spawning stock
// Propof F and M before spawning should possibly be age - related.
  for(i = 1;i<=nyrs+nsimuyrs;i++) {
    Spawningstock(i) = 0;
    for(j = minssbage; j <= nages; j++)
 	Spawningstock(i) += N(i,j)*ssbWts(i,j)*StockSexMat(i,j)*
	mfexp(-(natM(i,j)*PropofMbeforeSpawning+F(i,j)*PropofFbeforeSpawning));
    Cbio1(i) = sum(elem_prod(N(i)(3,nages),StockWts(i)(3,nages)))/1.0e6;
    Cbio2(i) = sum(elem_prod(N(i)(3,nages),CatchWts(i)(3,nages)))/1.0e6;
    if(i < nyrs+nsimuyrs)
      HCRRefbio(i) = sum(elem_prod(N(i+1),elem_prod(StockWts(i+1),wtsel(StockWts(i+1),HCRreflebreak))))/1.0e6;
     if(i ==  nyrs+nsimuyrs) HCRRefbio(i) = HCRRefbio(i-1);
     CbioR(i) = 0;
     for(j = a1; j <= nages; j++)
       CbioR(i)  = CbioR(i) + N(i,j)*CatchWts(i,j)*MeanSel(j)*(1-exp(-Z(i,j)))/Z(i,j);
   }
   CbioR/= 1.0e6;
   Spawningstock /= 1.0e6;
//   CbioR(i)  = sum(elem_prod(elem_prod(N(i)(a1,nages),CatchWts(i)),meansel))/1.0e6;


//  Ratios of spawning stock and spawning stock in the beginning of 2001.

   RelSpawningstock = Spawningstock(nyrs-3,nyrs+nsimuyrs)/Spawningstock(nyrs);
   RelCbioR = CbioR(nyrs-3,nyrs+nsimuyrs)/CbioR(nyrs);
   RelCbio1 = Cbio1(nyrs-3,nyrs+nsimuyrs)/Cbio1(nyrs);
   RelCbio2 = Cbio2(nyrs-3,nyrs+nsimuyrs)/Cbio2(nyrs);


   PredCbio1=Cbio1(nyrs-3,nyrs+nsimuyrs);
   PredCbio2=Cbio2(nyrs-3,nyrs+nsimuyrs);
   PredCbioR=CbioR(nyrs-3,nyrs+nsimuyrs);
   PredHCRRefbio = HCRRefbio(nyrs-3,nyrs+nsimuyrs);
   PredN3=N3(nyrs-3,nyrs+nsimuyrs);
   PredSpawningstock=Spawningstock(nyrs-3,nyrs+nsimuyrs);

   for(i = nyrs-3; i <= nyrs+nsimuyrs; i++)
     PredN2(i) = N(i,2);




// Program to calculate catch in numbers, catch in tonnes and proportion of
// each age group in catch.

FUNCTION get_catch_at_age
  int i = 0;
// C = F/Z*(1-exp(-Z))*N  not needed for cohort analyzis but kept here anyway.
  for(i = 1;i<=nyrs+nsimuyrs;i++)
    CalcCatchInNumbers(i )=elem_prod(elem_div(F(i)(a1,nages),Z(i)(a1,nages)),elem_prod(1.-Spc(i)(a1,nages),N(i)(a1,nages)));

// Calculate Catchh in 1000 tonnes and total catch in numbers.
// N is in thousands, weight in g so division by 1e6 is used to convert
// to 1000 tonnes.

  TotalCalcCatchInNumbers = rowsum(CalcCatchInNumbers);
  CalcCatchIn1000tons = rowsum(elem_prod(CalcCatchInNumbers,CatchWts))/1.0e6;
  for(i = nyrs+1; i <= nyrs+nsimuyrs; i++)
     PredCatchIn1000tons(i) = CalcCatchIn1000tons(i);
  for(i = 1 ; i <= nyrs+nsimuyrs; i++)  {
    PropInCatch(i) = CalcCatchInNumbers(i)/TotalCalcCatchInNumbers(i);
    HarvestRatio(i) = CalcCatchIn1000tons(i)/CbioR(i);
  }
  PredHarvestRatio = HarvestRatio(nyrs-3,nyrs+nsimuyrs);



FUNCTION evaluate_the_objective_function

 double eps = 1e-6;
 int i = 0;
 int j = 0;
 printcounter = printcounter + 1;
 LnLikelicomp = 0;

//  WeightCorr() # Needs to be fixed;
//     cout << "L5"<<flush;
//SSBrecrweight = 0 means that SSB-recr function is not used
//default values for SSBrecrweight is 1,
  LnLikelicomp(5) =  SSB_Recruitment_loglikeli_nocorr();

//Survey weight can be very low or 0. AD model builder has no problem
//With independed variables not used.

//     cout << "L6"<<flush;
  LnLikelicomp(6) = Survey_loglikeli1();
  LnLikelicomp(6) += Survey_loglikeli2();

;

// Catchrule.  Might have to make it differentiable complications due to fishing year.
  if(current_phase() > 3) IceHadHarvestrule();
//    SpecifiedCatch();
  if(current_phase() < 3)   SpecifiedF() ;
   LnLikely = sum(elem_prod(LnLikelicomp,Likeliweights));
//   cout << LnLikelicomp << endl;


//************************************************************************
// Log-likelihood function for Survey data.  Based on age-disaggregated
// Survey data and lognormal errors. Like with catch_loglikeli1 some
// complications arise from the  correlations.

FUNCTION dvariable Survey_loglikeli1()
// Survey indices Look if surveylastyear > nyrs Add time of year that survey takes place.
//   i <= min(nyrs+nsimuyrs,surveylastyear) is useful in retros.
// After first age with FirstageWithFullcatchability the selection is flat
  int i;
  int j;
  int k;
//  dvariable Surveycorr = 0.39;
  dvariable age;
  dvariable value = 0;
  dvariable eps = 1e-3;  // small number  dvariable value;
  dvariable lnDet;
  dvariable pZ;  // Z before survey.
  dvariable sign;
  dvar_vector SigmaSurveytmp(1,surveylastagenr-surveyfirstagenr+1);
  dvar_vector Surveydiff(1,surveylastagenr-surveyfirstagenr+1);
//  dvar_matrix Scorrmat(1,surveylastagenr-surveyfirstagenr+1,
//		1,surveylastagenr-surveyfirstagenr+1);

  SurveyPower = 1;  // Changed for youngest fish.

// Set up variances as a parabola.  SigmaSurveytmp is indexed from age 1 and
// used for other purposes later.
  for(j = surveyfirstagenr; j <= surveylastagenr-2; j++) {
    SigmaSurvey(j) = mfexp(logSigmaSurvey(j));
  }
  SigmaSurvey(surveylastagenr-1) =  SigmaSurvey(surveylastagenr-2)*1.25;
  SigmaSurvey(surveylastagenr) =  SigmaSurvey(surveylastagenr-1)*1.25;


  for(j = surveyfirstagenr; j <= surveylastagenr; j++) {
    age = j + surveyfirstage -1 ;
    SigmaSurveytmp(j-surveyfirstage+1) = SigmaSurvey(j);
    Scorrmat(j,j) = 1;
    for(k = 1; k < j; k++) {
      Scorrmat(j,k) = pow(Surveycorr,j-k); // Eða Scorrmat1;
      if(j <= 2 || k <= 2) Scorrmat(j,k) = 0;  // Núllgrúppa ekki korrelerður
      Scorrmat(k,j) = Scorrmat(j,k);
    }
  }
  Scorrmat = elem_prod(outer_prod(SigmaSurveytmp,SigmaSurveytmp),Scorrmat);
  if(active(SurveylnQest)) {
   for( j  = surveyfirstagenr; j <= FirstageWithFullcatchability; j++)
     SurveylnQ(j) = SurveylnQest(j);
   for( j  = FirstageWithFullcatchability-firstage+1; j <= surveylastagenr; j++)
     SurveylnQ(j) = SurveylnQest(FirstageWithFullcatchability-firstage+1);
   for(j = surveyfirstagenr; j<  FirstageWithConstantCatchability-firstage+1; j++)
    SurveyPower(j) = SurveyPowerest(j);

  }
// guess in when SurveylnQ is not active.  power is 1 in that case.
// not use the survey further than nyrs+1 or even nyrs in some cases
// if survey is not available at the time of assessment.
  else {
    for(j = surveyfirstagenr; j <= surveylastagenr; j++){
      SurveylnQ(j) = 0;
      for(i = surveyfirstyearnr; i <= min(nyrs+1, surveylastyearnr); i++)
        if(ObsSurveyNr(i,j) != -1) {
         pZ = SurveyPropOfF*F(i,j)+SurveyPropOfM*natM(i,j);
         SurveylnQ(j) += log((ObsSurveyNr(i,j)+Surveyepsilon(j))/(N(i,j)*mfexp(-pZ)));
        }
    }
    SurveylnQ/= (min(nyrs+1,surveylastyearnr)-surveyfirstyearnr+1);
    SurveylnQest = SurveylnQ(surveyfirstagenr,FirstageWithFullcatchability);
  }
  lnDet = log(det(Scorrmat));
  Scorrmat = inv(Scorrmat);
  for( i = surveyfirstyearnr; i <= min(nyrs+1, surveylastyearnr); i++) {
    for(j = surveyfirstagenr; j <= surveylastagenr; j++) {
      pZ = SurveyPropOfF*F(i,j)+SurveyPropOfM*natM(i,j);
      CalcSurveyNr(i,j) = mfexp(log(N(i,j)*mfexp(-pZ))*SurveyPower(j)+SurveylnQ(j)+SurveylnYeareffect(i));
      Surveydiff(j-surveyfirstagenr+1) = log( (ObsSurveyNr(i,j)+Surveyepsilon(j))/(CalcSurveyNr(i,j)+Surveyepsilon(j)) );
      RSsurveydiff(i,j) = Surveydiff(j-surveyfirstagenr+1);
    }
    value  += 0.5*lnDet+0.5*Surveydiff*Scorrmat*Surveydiff;
  }
  for(i =  surveyfirstyearnr ; i<= min(surveylastyearnr,nyrs+nsimuyrs) ; i++)
    CalcSurveybio(i) = sum(elem_prod(CalcSurveyNr(i),StockWts(i)(surveyfirstagenr,surveylastagenr)))/1000;
  return value;

// *************************-------------------------*********************
FUNCTION dvariable Survey_loglikeli2()
// Survey indices Look if surveylastyear > nyrs Add time of year that survey takes place.
//   i <= min(nyrs+nsimuyrs,surveylastyear) is useful in retros.
// After first age with FirstageWithFullcatchability the selection is flat
  int i;
  int j;
  int k;
//  dvariable Surveycorr = 0.39;
  dvariable age;
  dvariable value = 0;
  dvariable eps = 1e-3;  // small number  dvariable value;
  dvariable lnDet;
  dvariable pZ;  // Z before survey.
  dvariable sign;
  dvar_vector SigmaSurveytmp(1,surveylastagenr2-surveyfirstagenr2+1);
  dvar_vector Surveydiff(1,surveylastagenr2-surveyfirstagenr2+1);
//  dvar_matrix Scorrmat(1,surveylastagenr2-surveyfirstagenr2+1,
//		1,surveylastagenr2-surveyfirstagenr2+1);

  SurveyPower2 = 1;  // Changed for youngest fish.

// Set up variances as a parabola.  SigmaSurveytmp is indexed from age 1 and
// used for other purposes later.
 for(j = surveyfirstagenr2; j <= surveylastagenr2-2; j++) {
    SigmaSurvey2(j) = mfexp(logSigmaSurvey2(j));
  }
  SigmaSurvey2(surveylastagenr2-1) =  SigmaSurvey2(surveylastagenr2-2)*1.25;
  SigmaSurvey2(surveylastagenr2) =  SigmaSurvey2(surveylastagenr2-1)*1.25;
  for(j = surveyfirstagenr2; j <= surveylastagenr2; j++) {
    age = j + surveyfirstage2 -1 ;
    SigmaSurveytmp(j-surveyfirstage2+1) = SigmaSurvey2(j);
    Scorrmat2(j,j) = 1;
    for(k = 1; k < j; k++) {
      Scorrmat2(j,k) = pow(Surveycorr2,j-k); // Eða Scorrmat1;
      if(j <= 2 || k <= 2) Scorrmat2(j,k) = 0;  // Núllgrúppa ekki korrelerður
      Scorrmat2(k,j) = Scorrmat2(j,k);
    }
  }
  Scorrmat2 = elem_prod(outer_prod(SigmaSurveytmp,SigmaSurveytmp),Scorrmat2);
  if(active(SurveylnQest2)) {
   for( j  = surveyfirstagenr2; j <= FirstageWithFullcatchability2; j++)
     SurveylnQ2(j) = SurveylnQest2(j);
   for( j  = FirstageWithFullcatchability2-firstage+1; j <= surveylastagenr2; j++)
     SurveylnQ2(j) = SurveylnQest2(FirstageWithFullcatchability2-firstage+1);
   for(j = surveyfirstagenr2; j<  FirstageWithConstantCatchability2-firstage+1; j++)
    SurveyPower2(j) = SurveyPowerest2(j);

  }
// guess in when SurveylnQ is not active.  power is 1 in that case.
// not use the survey further than nyrs+1 or even nyrs in some cases
// if survey is not available at the time of assessment.
  else {
    for(j = surveyfirstagenr2; j <= surveylastagenr2; j++){
      SurveylnQ2(j) = 0;
      for(i = surveyfirstyearnr2; i <= min(nyrs+1, surveylastyearnr2); i++)
        if(ObsSurveyNr2(i,j) != -1) {
         pZ = SurveyPropOfF2*F(i,j)+SurveyPropOfM2*natM(i,j);
         SurveylnQ2(j) += log((ObsSurveyNr2(i,j)+Surveyepsilon2(j))/(N(i,j)*mfexp(-pZ)));
        }
    }
    SurveylnQ2/= (min(nyrs+1,surveylastyearnr2)-surveyfirstyearnr2+1);
    SurveylnQest2 = SurveylnQ2(surveyfirstagenr2,FirstageWithFullcatchability2);
  }
  lnDet = log(det(Scorrmat2));
  Scorrmat2 = inv(Scorrmat2);
  for( i = surveyfirstyearnr2; i <= min(nyrs+1, surveylastyearnr2); i++) {
    if(ObsSurveyNr2(i, surveyfirstagenr2) != -1){
      for(j = surveyfirstagenr2; j <= surveylastagenr2; j++) {
        pZ = SurveyPropOfF2*F(i,j)+SurveyPropOfM2*natM(i,j);
        CalcSurveyNr2(i,j) = mfexp(log(N(i,j)*mfexp(-pZ))*SurveyPower2(j)+SurveylnQ2(j)+SurveylnYeareffect2(i));
        Surveydiff(j-surveyfirstagenr2+1) = log( (ObsSurveyNr2(i,j)+Surveyepsilon2(j))/(CalcSurveyNr2(i,j)+Surveyepsilon2(j)) );
        RSsurveydiff2(i,j) = Surveydiff(j-surveyfirstagenr+1);
      }
      value  += 0.5*lnDet+0.5*Surveydiff*Scorrmat2*Surveydiff;
    }
  }
  for(i =  surveyfirstyearnr2 ; i<= min(surveylastyearnr2,nyrs+nsimuyrs) ; i++)
    CalcSurveybio2(i) = sum(elem_prod(CalcSurveyNr2(i),StockWts(i)(surveyfirstagenr2,surveylastagenr2)))/1000;
  return value;

// *************************-------------------------*********************


FUNCTION dvariable Survey_loglikeliNocorr()
  int i,j;
  dvariable pZ;
  dvariable value = 0;
  SurveyPower = 1;
  for(j = surveyfirstagenr; j <= surveylastagenr; j++)
    SigmaSurvey(j) = mfexp(logSigmaSurvey(j));
  if(active(SurveylnQest)) {
   for( j  = surveyfirstagenr; j <= FirstageWithFullcatchability; j++)
     SurveylnQ(j) = SurveylnQest(j);
   for( j  = FirstageWithFullcatchability-firstage+1; j <= surveylastagenr; j++)
     SurveylnQ(j) = SurveylnQest(FirstageWithFullcatchability-firstage+1);
   for(j = surveyfirstagenr; j<  FirstageWithConstantCatchability-firstage+1; j++)
    SurveyPower(j) = SurveyPowerest(j);

  }
// guess in when SurveylnQ is not active.  power is 1 in that case.
// not use the survey further than nyrs+1 or even nyrs in some cases
// if survey is not available at the time of assessment.
  else {
    for(j = surveyfirstagenr; j <= surveylastagenr; j++){
      SurveylnQ(j) = 0;
      for(i = surveyfirstyearnr; i <= min(nyrs+1, surveylastyearnr); i++)
        if(ObsSurveyNr(i,j) != -1)
          SurveylnQ(j) += log((ObsSurveyNr(i,j)+Surveyepsilon(j))/N(i,j));
    }
    SurveylnQ/= (min(nyrs+1,surveylastyearnr)-surveyfirstyearnr+1);
    SurveylnQest = SurveylnQ(surveyfirstagenr,FirstageWithFullcatchability);
  }
  for( i = surveyfirstyearnr; i <= min(nyrs+1, surveylastyearnr); i++) {
    for(j = surveyfirstagenr; j <= surveylastagenr; j++) {
      pZ = SurveyPropOfF*F(i,j)+SurveyPropOfM*natM(i,j);
      CalcSurveyNr(i,j) = mfexp(log(N(i,j)*mfexp(-pZ))*SurveyPower(j)+SurveylnQ(j)+SurveylnYeareffect(i));
      RSsurveydiff(i,j) = log( (ObsSurveyNr(i,j)+Surveyepsilon(j))/(CalcSurveyNr(i,j)+Surveyepsilon(j)) );
      value += square(RSsurveydiff(i,j))/(2*square(SigmaSurvey(j)))+log(SigmaSurvey(j));
    }
  }
  for(i =  surveyfirstyearnr ; i<= min(surveylastyearnr,nyrs+nsimuyrs) ; i++)
    CalcSurveybio(i) = sum(elem_prod(CalcSurveyNr(i),StockWts(i)(surveyfirstagenr,surveylastagenr)))/1000;
  return value;

// Likelihood function for Spawning Stock - Recruitment Relationship
// Convenient to define the matrices here but it would be better if they
// could be made static.

FUNCTION dvariable SSB_Recruitment_loglikeli()
  // logSSBmax is in reality 5 times  the  spawing stock giving 1/2 maximum recruitment if Beverton
  // and holt.  Therefore logSSBmax/5 in the relationship.
  // N1 and PredN_1 eru fjöldi fiska 0 ára.

  int ssbRecyrs = nyrs+nsimuyrs-firstage;
  int ssbRecdatayrs = nyrs - firstage;
  int i = 0;
  int j = 0;
  dvariable tmpssb;  // temporary variable
  dvariable minssb = 0.4; // SSB beoynd which cv is independent
  dvariable maxssb = 2.5; // of ssb
  dvariable spawnlnDet;
  dvariable sign;
  dvar_vector tmprecr(1,ssbRecyrs);
  dvar_matrix spawncorrmatrix(1,nyrs+nsimuyrs-firstage,1,nyrs+nsimuyrs-firstage);
  dvar_vector relspawn(1,ssbRecyrs);  // SSB/500 in some power

  for(i = 1; i <= ssbRecyrs ; i++)
   relspawn(i) = pow(SmoothDamper(Spawningstock(i)/500.0,maxssb,minssb),Spawnpowest);

  PredNfromSSB();
  // Calculate spawncorrmatrix. Do not have to do it every step
  // if spawnpow =  0;
  for(i = 1; i <= ssbRecyrs ;i++){
     spawncorrmatrix(i,i) = 1/relspawn(i);
     for( j = 1; j < i; j++) {
       spawncorrmatrix(i,j) = pow(Spawncorrest,i-j)/sqrt(relspawn(i)*relspawn(j));
       spawncorrmatrix(j,i) = spawncorrmatrix(i,j);
     }
  }

  for(i = 1; i <= ssbRecyrs ;i++)
    N_1(i) = N(i+firstage,1);
  resid_1 = log(predN_1)-log(N_1);
  tmprecr  = solve(spawncorrmatrix,resid_1,spawnlnDet,sign);

//   Note that SpawnCv is multiplied by nyrs-firstage SpawnlnDet needs probably
//   Similar treadment

   return 0.5*spawnlnDet+log(SpawnCvest)*(nyrs-firstage)+0.5*resid_1*tmprecr/(SpawnCvest*SpawnCvest);


FUNCTION dvariable SSB_Recruitment_loglikeli_nocorr()
  // logSSBmax is in reality 5 times  the  spawing stock giving 1/2 maximum recruitment if Beverton
  // and holt.  Therefore logSSBmax/5 in the relationship.
  // N1 and PredN_1 eru fjöldi fiska 0 ára.
  dvariable value;
  int ssbRecyrs = nyrs+nsimuyrs-firstage;
  int ssbRecdatayrs = nyrs - firstage;
  int i = 0;
  int j = 0;
  dvariable minssb = 0.4; // SSB beoynd which cv is independent
  dvariable maxssb = 2.5; // of ssb
  dvar_vector SigmaSSBRecr(1,ssbRecyrs);  // SSB/500 in some power

  PredNfromSSB();

// Do not use spawnpow as with cod.
  for(i = 1; i <= ssbRecyrs ; i++)
    SigmaSSBRecr(i) = SpawnCvest;
  return sum(log(SigmaSSBRecr(1,ssbRecdatayrs)))+0.5*sum(square(elem_div(resid_1,SigmaSSBRecr)));
// Function that calculates predicted rectcruitment from spawning stock



FUNCTION PredNfromSSB
  int ssbRecyrs = nyrs+nsimuyrs-firstage;
  int ssbRecdatayrs = nyrs - firstage;
  int i = 0;
  int j = 0;
  dvar_vector matN(a1,nages);
  dvariable sumN; // temporary variable
  dvariable tmpssb;  // temporary variable
  dvariable Rmax = mfexp(logRmax);
  dvariable SSBmax = mfexp(logSSBmax);
  dvar_vector feuc(1,ssbRecyrs);  // feucundity
  dvar_vector TimeDrift(1,ssbRecyrs);
  TimeDrift(1) = 0;
  for(i = 2; i <= ssbRecyrs ;i++) {
    if(i <= nyrs -5 ) TimeDrift(i) = TimeDrift(i-1) + RecrDrift(1);
    if( i > nyrs - 5) TimeDrift(i) = TimeDrift(i-1);
   }
// Calculate Shannon index.  Used in some SSB-recruitment functions.
// matN should in reality be called matBio at least in this version
   for(i = 1; i <= ssbRecyrs ;i++){
      matN = elem_prod( elem_prod(N(i)(a1,nages),StockSexMat(i)), ssbWts(i) ); //thg
      sumN = sum(matN); //thg shannon
      Shannon(i) = log(sumN)-sum(elem_prod(matN,log(matN+0.0001)))/sumN; //thg
   }
   Shannon -= sum(Shannon)/ssbRecyrs;

// Drift up to nyrs - 3 ala GG
//   dvariable RecrDrift = 0.00;  // timedrift
   Rmax = mfexp(logRmax);
   SSBmax = mfexp(logSSBmax);
// Drift stops after nyrs.
   if(SSBRectype == 1) {
     for(i = 1; i <= ssbRecyrs ;i++)
        predN_1(i) = Rmax*mfexp(-TimeDrift(i))*Spawningstock(i)/
        (SSBmax/5.0+Spawningstock(i));
   }
   // Ricker.  Here logSSBmax exists.
   if(SSBRectype == 2) {
   for(i = 1; i <= ssbRecyrs ;i++)
       predN_1(i) = Rmax*mfexp(-TimeDrift(i))*mfexp(1.0)/SSBmax*Spawningstock(i)*mfexp(-Spawningstock(i)/SSBmax);
   }
   if(SSBRectype == 3) {  // Ricker + Shannon  THG gefur verra fit en 4.
     for(i = 1; i <= ssbRecyrs ;i++)
       predN_1(i) = Rmax*mfexp(1.0)/SSBmax*Spawningstock(i)*mfexp(-Spawningstock(i)/SSBmax)*mfexp(dSha*Shannon(i));
   }
   if(SSBRectype == 4) {  // Ricker + Shannon  other type dSha mjög illa metinn
     for(i = 1; i <= ssbRecyrs ;i++){
       tmpssb = Spawningstock(i)*dSha*mfexp(Shannon(i));
       predN_1(i) = Rmax*mfexp(-TimeDrift(i))*mfexp(1.0)/SSBmax*tmpssb*
	 mfexp(-tmpssb/SSBmax);
     }
   }
// Eggjaframleiðslu út frá rallgögnum nota ssbwt.  4.3e-6 er reiknað
// úr rallgögnum en mat er 2e-6 á hlutfallinu eggjafr/biomassi vs þyngd
// gefur svipað fit og ricker spawncvest = 0.37,spawnpow=0.15 og spawncorr=0.13
// Í fyrstu umferð gleymdist sennilega að margfalda með kynþroska og stilla
// greiningu úr rallgögnum á samsvarandi hátt.


   if(SSBRectype == 5) {
     for(i = 1; i <= ssbRecyrs ;i++){
       tmpssb = 0;
       for(j = a1 ; j <= nages; j++)
	  tmpssb += N(i,j)*StockSexMat(i,j)*ssbWts(i,j)*ssbWts(i,j)*fecunditymultiplier*
	  mfexp(-(natM(i,j)*PropofMbeforeSpawning+F(i,j)*PropofFbeforeSpawning));
       tmpssb /= 1e12;
       tmpssb *= 50; // to be able to use Ricker or BH
       feuc(i) = tmpssb;
       predN_1(i) = Rmax*mfexp(1.0)/SSBmax*Spawningstock(i)*mfexp(-Spawningstock(i)/SSBmax);
     }
   }
// Fixed mean
   if(SSBRectype == 6) {
   for(i = 1; i <= ssbRecyrs ;i++)
       predN_1(i) = Rmax*mfexp(-TimeDrift(i));
   }



   for(i = 1; i <= ssbRecyrs ;i++)
     N_1(i) = N(i+firstage,1);
   resid_1 = log(predN_1)-log(N_1);

// Errors in weight.

FUNCTION WeightCorr;
  int i;
  int j;
  dvar_matrix wtcorrmatrix(1,nsimuyrs,1,nsimuyrs);
  dvariable logdet;
  dvariable SigmaWt = 0.1;
  dvariable Wtcorr = 0.35;
  for(i = 1; i <= nsimuyrs ;i++){
     wtcorrmatrix(i,i) = 1;
     for( j = 1; j < i; j++) {
       wtcorrmatrix(i,j) = pow(Wtcorr,i-j);
       wtcorrmatrix(j,i) = wtcorrmatrix(i,j);
     }
  }
  wtcorrmatrix  = wtcorrmatrix*square(SigmaWt);
  logdet = log(det(wtcorrmatrix));
  wtcorrmatrix = inv(wtcorrmatrix);
  LnLikelicomp(1) = 0.5*logdet+0.5*Weighterr*wtcorrmatrix*Weighterr;



FUNCTION IceHadHarvestrule
  LnLikelicomp(8) = 0;
  int j = 0;
  int i = 0;
//  for(i = 1; i <= nsimuyrs ;i++){
//     assessmentcorrmatrix(i,i) = 1;
//     for( j = 1; j < i; j++) {
//       assessmentcorrmatrix(i,j) = pow(Assessmentcorr,i-j);
//       assessmentcorrmatrix(j,i) = assessmentcorrmatrix(i,j);
//     }
//  }
//* comment out if assessment err is not included.
// tmperr  = solve(assessmentcorrmatrix,Assessmenterr,assesslnDet,sign);
//  LnLikelicomp(7) = 0.5*assesslnDet+log(CvAssessment)*nsimuyrs+0.5*Assessmenterr*tmperr/(CvAssessment*CvAssessment);

  dvariable refcatch;
  dvariable SigmaImpl = 0.05; // ImplementationCV  in CatchRule low.
  for(i = nyrs+1; i <= nyrs + nsimuyrs; i++) {
    refcatch =AssessmentBias*HarvestProportion*HCRRefbio(i);
    cout << i << "refcatch" << refcatch << endl;
    refcatch = mfexp(log(refcatch)+Assessmenterr(i-nyrs));  // Put the error on refcatch;
    if(NextYearsTac > 0 && i == nyrs+1 ) refcatch = NextYearsTac;  // Sometimes without error next year
    FishingYearCatch(i) = refcatch;
  }
  refcatch = QuotaLeft+FishingYearCatch(nyrs+1)/3;  // First simu year.
  LnLikelicomp(8) += square(log(CalcCatchIn1000tons(nyrs+1))-log(refcatch))/(2.*square(SigmaImpl)) + log(SigmaImpl);
  for(i = nyrs+2; i <= nyrs + nsimuyrs; i++) {
    if(i == nyrs + nsimuyrs) refcatch = FishingYearCatch(i);
    else  refcatch = FishingYearCatch(i)/3+
			     FishingYearCatch(i-1)*2/3;  // was (i+1)
    LnLikelicomp(8) += square(log(CalcCatchIn1000tons(i))-log(refcatch))/(2.*square(SigmaImpl)) + log(SigmaImpl);
  }



// CatchRule which is to specify the catch; // Comment assessmenterror out in this case.

FUNCTION SpecifiedCatch
  dvariable SigmaImpl = 0.05; // ImplementationCV  in CatchRule low.
  LnLikelicomp(7) = 0;  // No assessment error involved
  LnLikelicomp(8) = 0;
  int i;
// Use "real catch in retros")
  if(retroyears > 0) {
    for(i = nyrs+1; i <= min(nyrs+nsimuyrs,nyrs+retroyears); i++)
      LnLikelicomp(8) += square(log(CalcCatchIn1000tons(i))-log(CatchIn1000tonsforRetro(i)))/(2.*square(SigmaImpl)) + log(SigmaImpl);
    if(nyrs + nsimuyrs > ndatayrs)
      for(i = nyrs+retroyears+1; i <= nyrs+nsimuyrs; i++)
        LnLikelicomp(8) += square(log(CalcCatchIn1000tons(i))-log(FutureCatch(i-retroyears)))/(2.*square(SigmaImpl)) + log(SigmaImpl);
  }
  else  // not retro.
    for(i = nyrs+1; i <= nyrs+nsimuyrs; i++)
     LnLikelicomp(8) += square(log(CalcCatchIn1000tons(i))-log(FutureCatch(i)))/(2.*square(SigmaImpl)) + log(SigmaImpl);

FUNCTION SpecifiedF;
  dvariable SigmaImpl = 0.05; // ImplementationCV  in CatchRule low.
  LnLikelicomp(7) = 0;  // No assessment error involved

  dvar_matrix assessmentcorrmatrix(1,nsimuyrs,1,nsimuyrs);
  dvar_vector tmperr(1,nsimuyrs);
  dvariable assesslnDet;
  dvariable sign;

  LnLikelicomp(8) = 0;
  int i;
  int j;
  for(i = 1; i <= nsimuyrs ;i++){
     assessmentcorrmatrix(i,i) = 1;
     for( j = 1; j < i; j++) {
       assessmentcorrmatrix(i,j) = pow(Assessmentcorr,i-j);
       assessmentcorrmatrix(j,i) = assessmentcorrmatrix(i,j);
     }
  }
//* comment out if assessment err is not included.
 tmperr  = solve(assessmentcorrmatrix,Assessmenterr,assesslnDet,sign);
  LnLikelicomp(7) = 0.5*assesslnDet+log(CvAssessment)*nsimuyrs+0.5*Assessmenterr*tmperr/(CvAssessment*CvAssessment);


// Use "real catch in retros")
  if(retroyears > 0) {
    for(i = nyrs+1; i <= min(nyrs+1,nyrs+retroyears); i++)
      LnLikelicomp(8) += square(log(CalcCatchIn1000tons(i))-log(CatchIn1000tonsforRetro(i)))/(2.*square(SigmaImpl)) + log(SigmaImpl);
    if(nyrs + nsimuyrs > ndatayrs)
      for(i = nyrs+retroyears+1; i <= nyrs+1; i++)
        LnLikelicomp(8) += square(log(CalcCatchIn1000tons(i))-log(FutureCatch(i-retroyears)))/(2.*square(SigmaImpl)) + log(SigmaImpl);
  }
  else  {// not retro.
    for(i = nyrs+1; i <= nyrs+1; i++)
     LnLikelicomp(8) += square(log(CalcCatchIn1000tons(i))-log(FutureCatch(i)))/(2.*square(SigmaImpl)) + log(SigmaImpl);
     for(i = nyrs+2; i<= nyrs+nsimuyrs; i++)
	LnLikelicomp(8) += square(log(RefF(i) )-log(FutureF)-Assessmenterr(i-nyrs))/(2.*square(SigmaImpl)) + log(SigmaImpl);
  }





// For bayesian runs print out every 100 time.
FUNCTION BayesPrint
  if(printcounter == 100) {
    int i;
    ofstream outfile;
    outfile.open("result",ios::app);
    for( i = nyrs-6; i <= nyrs+nsimuyrs; i++) {
      outfile << firstyear+i-1 << " "<< Spawningstock(i)
      << " " << "-1" << " "<<  N(i,1) << " "
      << N(i,3) << " " << CbioR(i) << " "
      << Cbio2(i) << " " << CalcCatchIn1000tons(i)
      << " " << RefF(i) << endl;
     printcounter = 1;
     }
     outfile << "-1 -1 -1 -1 -1 -1 -1 -1 -1 " << endl;
     outfile.close();
 }



//  Smooth Roof and Floor.
FUNCTION dvariable  SmoothDamper(dvariable x, dvariable Roof,dvariable Floor)
  dvariable deltax = 0.01;
  if(Roof == Floor) return(x);
  dvariable lb = 1.0 - deltax/2.0;
  dvariable ub = 1.0 + deltax/2.0;
  if(x <= lb* Roof && x >= ub*Floor) return x;
  if(x >= ub*Roof) return Roof;
  if(x <= lb*Floor) return Floor;
  if(x <= ub*Roof && x >= lb*Roof) {
    dvariable y = (x - ub*Roof);
    return Roof - 0.5/deltax/Roof*y*y;
  }
  if(x >= lb*Floor && x <= ub*Floor) {
    dvariable  y = (x - lb*Floor);
    return Floor +0.5/deltax/Floor*y*y;
  }







REPORT_SECTION
  //report << "scorr " <<endl <<  inv(Scorrmat) << endl;

  report << "RSsurveydiff" << endl << RSsurveydiff  << endl;

  // Mostly output to matrices.
  report << "nyrs " << nyrs << endl;
  report << "ndatayrs " << ndatayrs << endl;
  report << "lastyear " << firstyear+nyrs-1 << endl;

  report << "CalcSurveyNr " << endl  << CalcSurveyNr << endl ;
  report << "ObsSurveyNr " << endl  << ObsSurveyNr << endl ;
  report << "SurveylnQ " << mfexp(SurveylnQ) << endl;
  report << "SurveyPowerest " << SurveyPowerest << endl;

  report << "predN_1 " << endl << predN_1 << endl;
  report << "N_1 " << endl <<  N_1 << endl;
//  report << " a50 " << a50 << endl;
  report << " meansel " << meansel << endl;
  report << "SigmaSurvey " << endl << SigmaSurvey << endl;
  report << "Estimated numbers of fish " << endl;  report << N << endl;
  report << "Estimated numbers in catch " << endl;
  report << CalcCatchInNumbers << endl;
  report << "Observed numbers in catch " << endl;
  report << ObsCatchInNumbers << endl;
  report << "Lnlikeli " << endl;
  report << LnLikelicomp << endl;
  report << "CatchIn1000tons " << endl << CatchIn1000tons << endl;
  report << "CalcCatchIn1000tons " << endl << CalcCatchIn1000tons << endl;
  report << "Spawningstock " << endl << Spawningstock << endl;
  report << "Cbio2 " << endl << Cbio2 << endl;
  report << "CbioR " << endl << CbioR << endl;
  report << "Shannon " << Shannon << endl;

  report << "Estimated fishing mortality " << endl  << F << endl;


// output in column oriented format. Need to include things not available for all years like survey data.
// -1 put in the file when data are notvailable.
// output in column oriented format. Need to include things not available for all years like survey data.
// -1 put in the file when data are notvailable.

   int j = 0;
   int i = 0;
//  Recalculate survey values for all years
 for( i = 1; i <= nyrs+nsimuyrs ; i++) {
    for(j = surveyfirstagenr; j <= surveylastagenr; j++) {
     pZ = SurveyPropOfF*F(i,j)+SurveyPropOfM*natM(i,j);
     if(i >= surveyfirstyearnr && i <= surveylastyearnr)
       CalcSurveyNr(i,j) = mfexp(log(N(i,j)*mfexp(-pZ))*SurveyPower(j)+SurveylnQ(j)+SurveylnYeareffect(i));
      else
        CalcSurveyNr(i,j) = mfexp(log(N(i,j)*mfexp(-pZ))*SurveyPower(j)+SurveylnQ(j));
    }
    CalcSurveybio(i) = sum(elem_prod(CalcSurveyNr(i),StockWts(i)(surveyfirstagenr,surveylastagenr)))/1000;
  }

  for( i = 1; i <= nyrs+nsimuyrs ; i++) {
    for(j = surveyfirstagenr2; j <= surveylastagenr2; j++) {
      pZ = SurveyPropOfF2*F(i,j)+SurveyPropOfM2*natM(i,j);
      if(i >= surveyfirstyearnr2 && i <= surveylastyearnr2)
      	   CalcSurveyNr2(i,j) = mfexp(log(N(i,j)*mfexp(-pZ))*SurveyPower2(j)+SurveylnQ2(j)+SurveylnYeareffect2(i));
      else
         CalcSurveyNr2(i,j) = mfexp(log(N(i,j)*mfexp(-pZ))*SurveyPower2(j)+SurveylnQ2(j));
    }
   CalcSurveybio2(i) = sum(elem_prod(CalcSurveyNr2(i),StockWts(i)(surveyfirstagenr2,surveylastagenr2)))/1000;
  }

  ofstream outfile("resultsbyyear");
   outfile << "year \t annualF \t F4-7 \t calccatch \t SSB \tOldSSB\t CbioR \t Cbio3+ \t N1 \t N2 \t N6 \t HCRRefbio \t FishingYearCatch \t obscatch \t a50 \t CalcSurveybio \t CalcSurveybio2\t Obssurveybio \t Obssurveybio2 \t PredN" << endl;
   for(i = 1; i <= nyrs+nsimuyrs ; i++) {
       outfile << firstyear+i-1 <<"\t"<< -1 << "\t" << RefF(i) << "\t" << CalcCatchIn1000tons(i) << "\t" << Spawningstock(i) << "\t" << "-1" <<  "\t" << CbioR(i) <<  "\t" << Cbio1(i) << "\t"
       << N(i,1) <<  "\t" <<  N(i,2) <<  "\t"  << N(i,6) <<  "\t" << HCRRefbio(i) << "\t" << FishingYearCatch(i) << "\t";
       if(i <= nyrs )
          outfile <<  CatchIn1000tons(i) <<  "\t" << "a50(i)" << "\t";
       else
          outfile <<  "-1\t-1\t";
       outfile << CalcSurveybio(i) << "\t" << CalcSurveybio2(i) << "\t";
       if(i >= surveyfirstyearnr && i <= surveylastyearnr)
          outfile << ObsSurveybio(i) << "\t";
       else
          outfile << "-1" << "\t";
       if(i >= surveyfirstyearnr2 && i <= surveylastyearnr2)
          outfile << ObsSurveybio2(i) << "\t";
       else
          outfile << "-1" << "\t";
           if(i > firstage)
	  outfile << predN_1(i-firstage) << endl;
       else
	  outfile << "-1" << endl;
   }
   outfile.close();


   outfile.open("resultsbyage");

  outfile << "age \t M \t surveysigma \t SurveylnQ \t SurveyPower \tmeansel \tprogsel\tsigma \tSurveySigma2 \t surveylnQ2 \tSurveyPower2" << endl ;
  for(i = 1; i <= nages; i++) {
    outfile << i+firstage-1 << "\t" << M1(i) << "\t";
    if(i >= surveyfirstagenr && i <= surveylastagenr)
       outfile  << SigmaSurvey(i) << "\t" << SurveylnQ(i) << "\t" <<  SurveyPower(i)  << "\t";
    else
       outfile << "-1\t-1\t-1\t";
    if(i >= a1)
       outfile << meansel(i) << "\t" << progsel(i) << "\t" <<  "-1\t";
    else
       outfile << "-1\t-1\t-1\t";
    if(i >= surveyfirstagenr2 && i <= surveylastagenr2)
       outfile  << SigmaSurvey2(i) << "\t" << SurveylnQ2(i) << "\t" << SurveyPower2(i) << endl;
    else
       outfile << "-1\t-1\t-1" << endl;
  }
  outfile.close();


    outfile.open("resultsbyyearandage");
    outfile << "year \t age \t N  \t Z \t StockWts \t M \t F \t CalcCno \t CatchWts \t SSBwts \t StockSexmat \tCatchSexmat\t ObsCno \tCalcSurveyNr\tCalcSurveyNr2 \tObsSurveyNr\tSurveyDiff\tObsSurveyNr2\tSurveyDiff2" << endl;
    for(i = 1; i <= nyrs+nsimuyrs; i++) {
      for(j = 1; j <= nages; j++) {
        outfile << firstyear+i-1 << "\t" << firstage+j-1 << "\t" << N(i,j) << "\t" << Z(i,j) << "\t" << StockWts(i,j) << "\t" << natM(i,j) << "\t";

        if(j >= a1)
	  outfile << F(i,j) << "\t" << CalcCatchInNumbers(i,j) << "\t" << CatchWts(i,j) << "\t" << ssbWts(i,j) << "\t" <<  StockSexMat(i,j) << "\t" <<  "-1" << "\t";
        else
	  outfile << "-1\t-1\t-1\t-1\t-1\t-1\t";

        if(i <= nyrs && j >= a1)
	  outfile << ObsCatchInNumbers(i,j) << "\t";
	else
	  outfile << "-1\t";
        if(j >= surveyfirstagenr && j <= surveylastagenr)
	   outfile << CalcSurveyNr(i,j) << "\t" ;
        else
	   outfile << "-1\t";

        if(j >= surveyfirstagenr2 && j <= surveylastagenr2)
	   outfile << CalcSurveyNr2(i,j) << "\t" ;
        else
	   outfile << "-1\t";

        if(j >= surveyfirstagenr && j <= surveylastagenr && i >= surveyfirstyearnr && i <= surveylastyearnr)
	   outfile <<  ObsSurveyNr(i,j) << "\t" << RSsurveydiff(i,j) << "\t";
        else
	   outfile << "-1\t-1" << "\t";

        if(j >= surveyfirstagenr2 && j <= surveylastagenr2 && i >= surveyfirstyearnr2 && i <= surveylastyearnr2)
	   outfile <<  ObsSurveyNr2(i,j) << "\t" << RSsurveydiff2(i,j) << endl;
        else
	   outfile << "-1\t-1" << endl;
      }
    }
    outfile.close() ;


FUNCTION update_weights // Random taka úr sambandi í retrói
  int i;
  int j;
  int skipyears = firstyear-firstdatayear;
  if(nyrs+nsimuyrs > ndatayrs-skipyears) {
    i = ndatayrs+1 ;
    for(j = a1; j <= nages; j++){
      ssbWts(i,j) = mfexp(log(ssbWtsData(ndatayrs+1,j)));//+Weighterr(i-nyrs)/2);
      CatchWts(i,j) = mfexp(log(CatchWtsData(ndatayrs+1,j))+Weighterr(i-nyrs)/2);
    }
    for(j = 1 ; j <= nages; j++)
      StockWts(i,j) = StockWtsData(ndatayrs+1,j);
  }
  for(i = ndatayrs+2 ; i <= min(ndatayrs+4,nyrs+nsimuyrs); i++) {
      for(j = a1; j <= nages; j++){
        ssbWts(i,j) = mfexp(log(ssbWtsData(i,j))+Weighterr(i-nyrs));
        CatchWts(i,j) = mfexp(log(CatchWtsData(i,j))+Weighterr(i-nyrs));
      }
      for(j = 1 ; j <= nages; j++)
        StockWts(i,j) = mfexp(log(StockWtsData(i,j))+Weighterr(i-nyrs));
  }

  if((nyrs+nsimuyrs) > (ndatayrs+4) ){
      for(i = ndatayrs+5 ; i <= (nyrs+nsimuyrs); i++) {
        for(j = a1; j <= nages; j++){
        ssbWts(i,j) = mfexp(log(ssbWtsData(ndatayrs+4,j))+Weighterr(i-nyrs));
        CatchWts(i,j) = mfexp(log(CatchWtsData(ndatayrs+4,j))+Weighterr(i-nyrs));     }
      for(j = 1 ; j <= nages; j++)
        StockWts(i,j) = mfexp(log(StockWtsData(ndatayrs+4,j))+Weighterr(i-nyrs));
    }

  }
// *******************-----------------***************


FUNCTION dvar_vector wtsel(dvar_vector StockWts,dvariable lebreak)
  return(1.0/(1.0+mfexp(-25.224-5.307*log(StockWts/pow(HCRreflebreak,3.0)))));

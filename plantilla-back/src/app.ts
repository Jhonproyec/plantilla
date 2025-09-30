import express, { Application, Request, Response } from 'express';
import { validateEnv } from './config/env';
import helmet from 'helmet';
import cors from 'cors';
import rateLimit from 'express-rate-limit';
import compression from 'compression';
import morgan from 'morgan';
import { logger } from './config/logger';
import { authRouter } from './routes/auth.routes';
import { notFound } from './utils/notFound';
import { errorHandler } from './utils/errorHandler';
import { userRoutes } from './routes/user.routes';
import { departamentRoute } from './routes/department.routes';
import { municipalityRoute } from './routes/municipality.routes';
import { orderRoute } from './routes/order.routes';
import { companyRoute } from './routes/company.routes';
import { dashboardRoute } from './routes/dashboard.routes';

export function createServer(): Application {
  validateEnv();
  const app: Application = express();

  // MIDDLEWARE DE SEGURIDAD
  app.use(
    helmet({
      contentSecurityPolicy: {
        directives: {
          defaultSrc: ["'self'"],
          styleSrc: ["'self'", "'unsafe-inline'"],
          scriptSrc: ["'self'"],
          imgSrc: ["'self'", "'data:'", 'https:'],
        },
      },
      hsts: {
        maxAge: 31536000, //HTTPS de un año
        includeSubDomains: true, //Incluye subdominios
        preload: true, //Navegadores confían siempre en https
      },
    })
  );

  app.use(
    cors({
      origin: process.env.CORS_ORIGIN?.split(',') || ['https://localhost:4200'],
      credentials: true,
      optionsSuccessStatus: 200,
    })
  );

  // LIMITAR PETICIONES
  const limiter = rateLimit({
    windowMs: parseInt(process.env.RATE_LIMIT_WINDOW_MS || '900000'), //15 MINUTOS
    max: parseInt(process.env.RATE_LIMIT_MAX_REQUEST || '100'),
    message: {
      error: 'Demasiados intentos desde esta IP, por favor intenta más tarde.',
    },
    standardHeaders: true,
    legacyHeaders: false,
  });

  app.use(limiter);

  //MIDDLEWARE GENERAL
  app.use(compression());
  app.use(express.json({ limit: '10mb' }));
  app.use(express.urlencoded({ extended: true, limit: '10mb' }));

  app.use(
    morgan('combined', {
      stream: {
        write: (message: string) => logger.info(message.trim()),
      },
    })
  );
  // TODO IMPLEMENTAR HEAL RUTAS
  // app.use('/health', healR)

  // API Routes
  const apiPrefix = process.env.API_PREFIX || '/api';
  const apiVersion = process.env.API_VERSION || 'v1';
  app.use(`${apiPrefix}/${apiVersion}/auth`, authRouter);
  app.use(`${apiPrefix}/${apiVersion}/user`, userRoutes);
  app.use(`${apiPrefix}/${apiVersion}/department`, departamentRoute);
  app.use(`${apiPrefix}/${apiVersion}/municipality`, municipalityRoute);
  app.use(`${apiPrefix}/${apiVersion}/order`, orderRoute);
  app.use(`${apiPrefix}/${apiVersion}/company`, companyRoute);
  app.use(`${apiPrefix}/${apiVersion}/dashboard`, dashboardRoute);

  app.get('/', (_: Request, res: Response) => {
    res.json({
      message: 'Backend API is running',
      version: '1.0.0',
      ENVIRONMENT: process.env.NODE_ENV,
    });
  });

  // TODO IMPLEMENTAR
  app.use(notFound);
  app.use(errorHandler);

  return app;
}

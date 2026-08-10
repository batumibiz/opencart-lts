<?php
// Debug
const DEBUG = true;

// APPLICATION
const APPLICATION = 'Admin';

// HTTP
const HTTP_SERVER = 'https://localhost/admin/';
const HTTP_CATALOG = 'https://localhost/';

// DIR
define('DIR_OPENCART', dirname(__DIR__) . '/');
const DIR_APPLICATION = DIR_OPENCART . 'admin/';
const DIR_EXTENSION = DIR_OPENCART . 'extension/';
const DIR_IMAGE = DIR_OPENCART . 'image/';
const DIR_SYSTEM = DIR_OPENCART . 'system/';
const DIR_CATALOG = DIR_OPENCART . 'catalog/';
const DIR_STORAGE = DIR_SYSTEM . 'storage/';
const DIR_LANGUAGE = DIR_APPLICATION . 'language/';
const DIR_TEMPLATE = DIR_APPLICATION . 'view/template/';
const DIR_CONFIG = DIR_SYSTEM . 'config/';
const DIR_CACHE = DIR_STORAGE . 'cache/';
const DIR_DOWNLOAD = DIR_STORAGE . 'download/';
const DIR_LOGS = DIR_STORAGE . 'logs/';
const DIR_SESSION = DIR_STORAGE . 'session/';
const DIR_UPLOAD = DIR_STORAGE . 'upload/';

// DB
const DB_DRIVER = 'mysqli';
const DB_HOSTNAME = 'mysql';
const DB_USERNAME = 'root';
const DB_PASSWORD = 'root';
const DB_DATABASE = 'opencart';
const DB_PORT = '3306';
const DB_PREFIX = 'oc_';

const DB_SSL_KEY = '';
const DB_SSL_CERT = '';
const DB_SSL_CA = '';

// OpenCart API
const OPENCART_SERVER = 'https://www.opencart.com/';

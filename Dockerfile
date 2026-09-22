FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    libxml2-dev \
    libxslt1-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm

CMD ["python", "-m", "MusicMan"]
